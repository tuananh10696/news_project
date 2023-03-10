<?php

namespace App\Model\Behavior;

use ArrayObject;
use Cake\Datasource\EntityInterface;
use Cake\Event\Event;
use Cake\ORM\Behavior;
use Cake\ORM\Entity;
use Cake\ORM\Query;
use Cake\Utility\Text;
use Cake\Filesystem\Folder;
use Cake\Event\EventManager;

class FileAttacheBehavior extends Behavior
{
    public $uploadDirCreate = true;
    public $uploadDirMask = 0777;
    public $uploadFileMask = 0666;

    //ImageMagick configure
    public $convertPath = '/usr/local/bin/convert';
    public $convertParams = '-thumbnail';

    protected $_defaultConfig = array(
        'uploadDir' => null,
        'wwwUploadDir' => null,
    );

    public $uploadDir = '';
    public $wwwUploadDir = '';


    public function initialize(array $config)
    {
        $Model = $this->getTable();
        $entity = $this->getTable()->newEntity();
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


    public function beforeMarshal(Event $event, ArrayObject $data, ArrayObject $options)
    {
        $this->setPath();

        $table = $event->getSubject();
        // images
        if (isset($table->attaches['images'])) {
            $attache_image_columns = $table->attaches['images'];
            foreach ($attache_image_columns as $column => $val) {
                if (isset($data[$column])) {

                    $data['_' . $column] = $data[$column];
                }

                if ((empty($data[$column]) || $data[$column]['error'] != UPLOAD_ERR_OK) && isset($data['_old_' . $column]) && $data['_old_' . $column] != "")
                    $data[$column] = $data['_old_' . $column];
            }
        }
        // files
        if (isset($table->attaches['files'])) {
            $attache_image_columns = $table->attaches['files'];
            foreach ($attache_image_columns as $column => $val) {
                if (isset($data[$column]))
                    $data['_' . $column] = $data[$column];

                if ((empty($data[$column]) || $data[$column]['error'] != UPLOAD_ERR_OK) && isset($data['_old_' . $column]) && $data['_old_' . $column] != "")
                    $data[$column] = $data['_old_' . $column];
            }
        }
    }


    public function beforeFind(Event $event, Query $query, ArrayObject $options, $primary)
    {
        $this->setPath();

        $table = $event->getSubject();
        // afterFind????????????
        $query->formatResults(function ($results) use ($table, $primary) {
            return $results->map(function ($row) use ($table, $primary) {
                if (is_object($row) && !array_key_exists('existing', $row->toArray())) {
                    $results = $this->_attachesFind($table, $row, $primary);
                }
                return $row;
            });
        });
    }


    public function afterSave(Event $event, EntityInterface $entity, ArrayObject $options)
    {
        $this->setPath();
        // pr($event);
        // pr($entity);
        // pr($options);
        //????????????????????????
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
        $_att_images = array();
        $_att_files = array();
        if (!empty($table->attaches['images'])) {
            $_att_images = $table->attaches['images'];
        }
        if (!empty($table->attaches['files'])) {
            $_att_files = $table->attaches['files'];
        }
        $entity = $results;
        // foreach ($results as $entity) {
        $columns = null;

        $entity->setVirtual(['attaches']);
        $_ = $entity->toArray();
        $entity_attaches = [];
        //image
        foreach ($_att_images as $columns => $_att) {
            $_attaches = array();
            if (isset($_[$columns])) {
                $_attaches['0'] = '';
                $_file = $this->wwwUploadDir . '/images/' . $_[$columns];
                if (is_file(WWW_ROOT . $_file)) {
                    $_attaches['0'] = $_file;
                }
                if (!empty($_att['thumbnails'])) {
                    foreach ($_att['thumbnails'] as $_name => $_val) {
                        $key_name = (!is_int($_name)) ? $_name : $_val['prefix'];
                        $_attaches[$key_name] = '';
                        $_file = $this->wwwUploadDir . '/images/' . $_val['prefix'] . $_[$columns];
                        if (!empty($_[$columns]) && is_file(WWW_ROOT . $_file)) {
                            $_attaches[$key_name] = $_file;
                        }
                    }
                }
                // pr($_attaches);
                $entity_attaches[$columns] = $_attaches;
            }
        }
        //file
        foreach ($_att_files as $columns => $_att) {
            $def = array('0', 'src', 'extention', 'name', 'download');
            $def = array_fill_keys($def, null);

            if (isset($_[$columns])) {
                $_attaches = $def;
                $_file = $this->wwwUploadDir . '/files/' . $_[$columns];
                if (is_file(WWW_ROOT . $_file)) {
                    $_attaches['0'] = $_file;
                    $_attaches['src'] = $_file;
                    $_attaches['extention'] = $this->getExtension($_[$columns . '_name']);
                    $_attaches['name'] = $_[$columns . '_name'];
                    $_attaches['size'] = $_[$columns . '_size'];
                    $download_dir = $table->getAlias();
                    if ($download_dir == 'InfoContents') {
                        $download_dir = 'Contents';
                    }
                    $_attaches['download'] = DS . $download_dir . '/file/' . $_[$table->getPrimaryKey()] . '/' . $columns . '/';
                }
                $entity_attaches[$columns] = $_attaches;
            }
        }
        $entity->attaches = $entity_attaches;
        // }
        return $results;
    }


    public function _uploadAttaches(Event $event, EntityInterface $entity)
    {
        $table = $event->getSubject();
        $this->checkUploadDirectory($table);

        // $table->eventManager()->off('Model.afterSave');

        if (!empty($entity)) {
            $_data = $entity->toArray();
            $id = $entity->id;
            $query = $table->find()->where([$table->getAlias() . '.' . $table->getPrimaryKey() => $id]);
            $old_entity = $query->first();
            $old_data = $old_entity->toArray();

            $_att_images = array();
            $_att_files = array();
            if (!empty($table->attaches['images'])) {
                $_att_images = $table->attaches['images'];
            }
            if (!empty($table->attaches['files'])) {
                $_att_files = $table->attaches['files'];
            }
            //upload images
            foreach ($_att_images as $columns => $val) {
                $uuid = Text::uuid();
                $image_name = array();
                if (!empty($_data['_' . $columns])) {
                    $image_name = $_data['_' . $columns];
                }
                if (!empty($image_name['tmp_name']) && $image_name['error'] === UPLOAD_ERR_OK) {
                    $basedir = $this->uploadDir . DS . 'images' . DS;
                    $imageConf = $_att_images[$columns];
                    $ext = $this->getExtension($image_name['name']);
                    $filepattern = $imageConf['file_name'];
                    $file = $image_name;
                    if ($info = getimagesize($file['tmp_name'])) {
                        //?????? ????????????
                        $convert_method = (!empty($imageConf['method'])) ? $imageConf['method'] : null;

                        if (in_array($ext, $imageConf['extensions'])) {
                            $newname = sprintf($filepattern, $id, $uuid) . '.' . $ext;
                            $this->convert_img(
                                $imageConf['width'] . 'x' . $imageConf['height'],
                                $file['tmp_name'],
                                $basedir . $newname,
                                $convert_method
                            );

                            //???????????????
                            if (!empty($imageConf['thumbnails'])) {
                                foreach ($imageConf['thumbnails'] as $suffix => $val) {
                                    //??????????????????
                                    $convert_method = (!empty($val['method'])) ? $val['method'] : null;
                                    //???????????????
                                    $prefix = (!empty($val['prefix'])) ? $val['prefix'] : $suffix;
                                    $_newname = $prefix . $newname;
                                    //??????
                                    $this->convert_img(
                                        $val['width'] . 'x' . $val['height'],
                                        $file['tmp_name'],
                                        $basedir . $_newname,
                                        $convert_method
                                    );
                                }
                            }
                            //
                            // $_data[$columns] = $newname;
                            $old_entity->set($columns, $newname);
                            // $table->patchEntity($entity, $_data, ['validate' => false]);
                            $table->save($old_entity);

                            // ????????????????????????
                            if (!empty($old_data['attaches'][$columns])) {
                                foreach ($old_data['attaches'][$columns] as $image_path) {
                                    if ($image_path && is_file(WWW_ROOT . $image_path)) {
                                        @unlink(WWW_ROOT . $image_path);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (!empty($_att_files)) {
                //upload files
                foreach ($_att_files as $columns => $val) {
                    $uuid = Text::uuid();

                    $file_name = array();
                    if (!empty($_data['_' . $columns])) {
                        $file_name = $_data['_' . $columns];
                    }
                    if (!empty($file_name['tmp_name']) && $file_name['error'] === UPLOAD_ERR_OK) {
                        $basedir = $this->uploadDir . DS . 'files' . DS;
                        $fileConf = $_att_files[$columns];
                        $ext = $this->getExtension($file_name['name']);
                        $filepattern = $fileConf['file_name'];
                        $file = $file_name;

                        if (in_array($ext, $fileConf['extensions'])) {
                            $newname = sprintf($filepattern, $id, $uuid) . '.' . $ext;
                            move_uploaded_file($file['tmp_name'], $basedir . $newname);
                            chmod($basedir . $newname, $this->uploadFileMask);

                            // $_data[$columns] = $newname;
                            // $_data[$columns.'_name'] = $file_name['name'];
                            // $_data[$columns.'_size'] = $file_name['size'];
                            $old_entity->set($columns, $newname);
                            $old_entity->set($columns . '_name', $this->getFileName($file_name['name'], $ext));
                            $old_entity->set($columns . '_size', $file_name['size']);
                            $old_entity->set($columns . '_extension', $ext);
                            // $table->patchEntity($entity, $_data, ['validate' => false]);
                            $table->save($old_entity);

                            // ????????????????????????
                            if (!empty($old_data['attaches'][$columns])) {
                                foreach ($old_data['attaches'][$columns] as $file_path) {
                                    if ($file_path && is_file(WWW_ROOT . $file_path)) {
                                        @unlink(WWW_ROOT . $file_path);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // $table->addBehavior('Position');
        }
    }


    /**
     * ??????????????????
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
     * ??????????????????????????????
     * @param $size [width]x[height]
     * @param $source ?????????????????????????????????(????????????)
     * @param $dist ????????????????????????????????????????????????
     * @param $method ????????????
     *        - fit     $size??????????????????????????????
     *        - cover   $size?????????????????????????????????
     *        - crop    cover ??????????????????$size??????????????????
     * */
    public function convert_img($size, $source, $dist, $method = 'fit')
    {
        list($ow, $oh, $info) = getimagesize($source);
        $sz = explode('x', $size);
        $cmdline = $this->convertPath;
        //???????????????????????????
        if (0 < $sz[0] && 0 < $sz[1]) {
            if ($ow <= $sz[0] && $oh <= $sz[1]) {
                //??????????????????????????????????????????????????????
                $size = $ow . 'x' . $oh;
                $option = $this->convertParams . ' ' . $size . '>';
            } else {
                //???????????????????????????????????????
                if ($method === 'cover' || $method === 'crop') {
                    //??????????????????
                    $crop = $size;
                    if (($ow / $oh) <= ($sz[0] / $sz[1])) {
                        //????????????
                        $size = $sz[0] . 'x';
                    } else {
                        //????????????
                        $size = 'x' . $sz[1];
                    }

                    //cover
                    $option = '-thumbnail ' . $size . '>';

                    //crop
                    if ($method === 'crop') {
                        $option .= ' -gravity center -crop ' . $crop . '+0+0';
                    }
                } else {
                    //??????????????? ????????????
                    $option = $this->convertParams . ' ' . $size . '>';
                }
            }
        } else {
            //??????????????????????????? ??????????????????
            $size = $ow . 'x' . $oh;
            $option = $this->convertParams . ' ' . $size . '>';
        }
        $a = system(escapeshellcmd($cmdline . ' ' . $option . ' ' . $source . ' ' . $dist));
        @chmod($dist, $this->uploadFileMask);
        return $a;
    }
}
