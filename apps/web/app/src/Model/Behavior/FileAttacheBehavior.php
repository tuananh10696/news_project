<?php

namespace App\Model\Behavior;

use ArrayObject;
use Cake\Datasource\EntityInterface;
use Cake\Event\EventInterface;
use Cake\ORM\Behavior;
use Cake\ORM\Query;
use Cake\Utility\Text;
use Cake\Filesystem\Folder;
use Cake\Core\Configure;

class FileAttacheBehavior extends Behavior
{
    // true = uploadedFileオブジェクト, false = 従来通りの配列
    const IS_FILE_OBJECT = true;

    public $uploadDirCreate = true;
    public $uploadDirMask = 0777;
    public $uploadFileMask = 0666;

    //ImageMagick configure
    public $convertPath = '/usr/local/bin/convert'; // Initializeで設定しているよ
    public $convertParams = '-thumbnail';

    protected $_defaultConfig = array(
        'uploadDir' => null,
        'wwwUploadDir' => null,
    );

    public $uploadDir = '';
    public $wwwUploadDir = '';


    public function initialize(array $config): void
    {
        $Model = $this->table();
        $entity = $this->table()->newEntity([]);
        $entity->setVirtual(['attaches']);

        $this->_config = $config + $this->_defaultConfig;

        $this->uploadDir = UPLOAD_DIR . $Model->getAlias();
        $this->wwwUploadDir = '/' . UPLOAD_BASE_URL . '/' . $Model->getAlias();

        if (!empty($config['uploadDir'])) {
            $this->uploadDir = $config['uploadDir'];
        }
        if (!empty($config['wwwUploadDir'])) {
            $this->wwwUploadDir = $config['wwwUploadDir'];
        }

        $this->convertPath = Configure::read('convert_path');
    }


    private function setPath()
    {
        if (!empty($this->_config['uploadDir'])) {
            $this->uploadDir = $this->_config['uploadDir'];
        }
        if (!empty($this->_config['wwwUploadDir'])) {
            $this->wwwUploadDir = $this->_config['wwwUploadDir'];
        }
    }


    public function beforeMarshal(EventInterface $event, ArrayObject $data, ArrayObject $options)
    {
        $this->setPath();
        $table = $event->getSubject();

        if (isset($table->attaches)) {
            foreach ($table->attaches as $cols => $vals) {
                if (!in_array($cols, ['images', 'files'], true)) continue;

                foreach ($vals as $col => $val) {
                    if (isset($data[$col])) {
                        $data['_' . $col] = $data[$col];
                        unset($data[$col]);
                    }

                    $not_data = empty($data[$col]) || $data[$col]['error'] != UPLOAD_ERR_OK;
                    $has_old_data = isset($data['_old_' . $col]) && $data['_old_' . $col] != "";

                    if ($not_data && $has_old_data) $data[$col] = $data['_old_' . $col];
                }
            }
        }
    }


    public function beforeFind(EventInterface $event, Query $query, ArrayObject $options, $primary)
    {
        $this->setPath();

        $table = $event->getSubject();
        // afterFindの代わり
        $query->formatResults(function ($results) use ($table, $primary) {
            return $results->map(function ($row) use ($table, $primary) {
                if (is_object($row) && !array_key_exists('existing', $row->toArray())) {
                    $results = $this->_attachesFind($table, $row, $primary);
                }
                return $row;
            });
        });
    }


    public function afterSave(EventInterface $event, EntityInterface $entity, ArrayObject $options)
    {
        $this->setPath();
        //アップロード処理
        $this->_uploadAttaches($event, $entity);
    }


    public function checkUploadDirectory($table)
    {
        $this->setPath();

        $Folder = new Folder();

        if ($this->uploadDirCreate) {
            $dir = $this->uploadDir . DS . 'images';
            if (!is_dir($dir) && !empty($table->attaches['images'])) {
                if (!$Folder->create($this->uploadDir . DS . 'images', $this->uploadDirMask)) {
                }
            }

            $dir = $this->uploadDir . DS . 'files';
            if (!is_dir($dir) && !empty($table->attaches['files'])) {
                if (!$Folder->create($dir, $this->uploadDirMask)) {
                }
            }
        }
    }


    protected function _attachesFind($table, $results, $primary = false)
    {
        $this->checkUploadDirectory($table);


        $attaches = [];

        if (isset($table->attaches)) {
            foreach ($table->attaches as $cols => $vals) {
                if (!in_array($cols, ['images', 'files'], true)) continue;

                foreach ($vals as $col => $val) {
                    $attaches[$col] = [];

                    if (!isset($results->{$col}) || is_null($results->{$col})) continue;
                    $f = $this->wwwUploadDir . DS . $cols . DS . $results->{$col};
                    $is_file = is_file(WWW_ROOT . $f);

                    if ($cols === 'images') {
                        $attaches[$col]['0'] = $is_file ? $f : '';
                        if (isset($val['thumbnails'])) {
                            foreach ($val['thumbnails'] as $_name => $_val) {
                                $key_name = (!is_int($_name)) ? $_name : $_val['prefix'];
                                $f_ = $this->wwwUploadDir . '/images/' . $key_name . $results->{$col};
                                $attaches[$col][$key_name] = is_file(WWW_ROOT . $f_) ? $f_ : '';
                            }
                        }
                    }
                    // files
                    else {
                        $attaches[$col] = [
                            '0' => $is_file ? $f : '',
                            'src' => $is_file ? $f : '',
                            'extention' => $is_file ? $results->{__('{0}_extension', $col)} : '',
                            'name' => $is_file ? $results->{__('{0}_name', $col)} : '',
                            'size' => $is_file ? $results->{__('{0}_size', $col)} : '',
                            'download' => ''
                        ];

                        if ($is_file) {
                            $download_dir = $table->getAlias();
                            $download_dir = $download_dir == 'InfoContents' ? 'Contents' : $download_dir;

                            $attaches[$col]['download'] = DS . $download_dir . '/file/' . $results->{$table->getPrimaryKey()} . '/' . $col . '/';
                        }
                    }
                }
            }
        }
        $results->attaches = $attaches;
        return $results;
    }


    public function _uploadAttaches(EventInterface $event, EntityInterface $entity)
    {
        $table = $event->getSubject();
        $this->checkUploadDirectory($table);

        if (empty($entity) || !isset($table->attaches) || empty($table->attaches)) return false;
        $id = $entity->id;

        $old_entity = $table->find()
            ->where([$table->getAlias() . '.' . $table->getPrimaryKey() => $id])
            ->first();

        foreach ($table->attaches as $cols => $vals) {
            if (!in_array($cols, ['images', 'files'], true)) continue;

            foreach ($vals as $col => $val) {
                $uuid = Text::uuid();

                if (is_null($entity->{'_' . $col})) continue;

                $item = $entity->{'_' . $col};

                $error = !is_string($item) ? $item->getError() : 1;

                if ($error !== UPLOAD_ERR_OK) continue;

                $basedir = $this->uploadDir . DS . $cols . DS;
                $client_name = $item->getClientFilename();
                $ext = $this->getExtension($client_name);
                $filepattern = $val['file_name'];
                $tmp = $item->getStream()->getMetadata('uri');

                $convert_method = (!empty($val['method'])) ? $val['method'] : null;

                if (!in_array($ext, $val['extensions'], true)) continue;

                $newname = sprintf($filepattern, $id, $uuid) . '.' . $ext;

                if ($cols === 'images') {
                    $this->convert_img(
                        $val['width'] . 'x' . $val['height'],
                        $tmp,
                        $basedir . $newname,
                        $convert_method
                    );

                    //サムネイル
                    if (isset($val['thumbnails']) && !empty($val['thumbnails'])) {

                        foreach ($val['thumbnails'] as $suffix => $val_thumb) {
                            //画像処理方法
                            $convert_method = (!empty($val_thumb['method'])) ? $val_thumb['method'] : null;
                            //ファイル名
                            $prefix = (!empty($val_thumb['prefix'])) ? $val_thumb['prefix'] : $suffix;
                            $_newname = $prefix . $newname;
                            //変換
                            $this->convert_img(
                                $val_thumb['width'] . 'x' . $val_thumb['height'],
                                $tmp,
                                $basedir . $_newname,
                                $convert_method
                            );
                        }
                    }
                }
                // files
                else {
                    move_uploaded_file($tmp, $basedir . $newname);
                    chmod($basedir . $newname, $this->uploadFileMask);

                    $old_entity->set($col . '_name', $this->getFileName($client_name, $ext));
                    $old_entity->set($col . '_size', $item->getSize());
                    $old_entity->set($col . '_extension', $ext);
                }

                // 旧ファイルの削除
                if (isset($old_entity->attaches[$cols]) && !empty($old_entity->attaches[$cols])) {
                    foreach ($old_entity->attaches[$cols] as $path) {
                        if ($path && is_file(WWW_ROOT . $path)) {
                            @unlink(WWW_ROOT . $path);
                        }
                    }
                }
                $old_entity->set($col, $newname);
                $table->save($old_entity);
            }
        }
    }


    /**
     * 拡張子の取得
     * */
    public function getExtension($filename)
    {
        return strtolower(substr(strrchr($filename, '.'), 1));
    }


    public function getFileName($filename, $ext)
    {
        return str_replace('.' . $ext, '', $filename);
    }


    /**
     * ファイルアップロード
     * @param $size [width]x[height]
     * @param $source アップロード元ファイル(フルパス)
     * @param $dist 変換後のファイルパス（フルパス）
     * @param $method 処理方法
     *        - fit     $size内に収まるように縮小
     *        - cover   $sizeの短い方に合わせて縮小
     *        - crop    cover 変換後、中心$sizeでトリミング
     * */
    public function convert_img($size, $source, $dist, $method = 'fit')
    {
        list($ow, $oh, $info) = getimagesize($source);
        $sz = explode('x', $size);
        $cmdline = $this->convertPath;
        //サイズ指定ありなら
        if (0 < $sz[0] && 0 < $sz[1]) {
            if ($ow <= $sz[0] && $oh <= $sz[1]) {
                //枠より完全に小さければ、ただのコピー
                $size = $ow . 'x' . $oh;
                $option = $this->convertParams . ' ' . $size . '>';
            } else {
                //枠をはみ出していれば、縮小
                if ($method === 'cover' || $method === 'crop') {
                    //中央切り取り
                    $crop = $size;
                    if (($ow / $oh) <= ($sz[0] / $sz[1])) {
                        //横を基準
                        $size = $sz[0] . 'x';
                    } else {
                        //縦を基準
                        $size = 'x' . $sz[1];
                    }

                    //cover
                    $option = '-thumbnail ' . $size . '>';

                    //crop
                    if ($method === 'crop') {
                        $option .= ' -gravity center -crop ' . $crop . '+0+0';
                    }
                } else {
                    //通常の縮小 拡大なし
                    $option = $this->convertParams . ' ' . $size . '>';
                }
            }
        } else {
            //サイズ指定なしなら 単なるコピー
            $size = $ow . 'x' . $oh;
            $option = $this->convertParams . ' ' . $size . '>';
        }
        $a = system(escapeshellcmd($cmdline . ' ' . $option . ' ' . $source . ' ' . $dist));
        @chmod($dist, $this->uploadFileMask);
        return $a;
    }
}
