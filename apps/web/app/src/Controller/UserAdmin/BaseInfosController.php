<?php

namespace App\Controller\UserAdmin;

use Cake\Utility\Inflector;
use Cake\Event\EventInterface;

use App\Model\Entity\Info;
use App\Model\Entity\PageConfig;
use App\Model\Entity\PageConfigItem;
use App\Model\Entity\AppendItem;
use App\Model\Entity\PageConfigExtension;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class BaseInfosController extends AppController
{
    private $GQuery = [];

    public function initialize(): void
    {
        parent::initialize();

        $this->Infos = $this->getTableLocator()->get('Infos');
        $this->InfoContents = $this->getTableLocator()->get('InfoContents');
        $this->SectionSequences = $this->getTableLocator()->get('SectionSequences');
        $this->PageConfigs = $this->getTableLocator()->get('PageConfigs');
        $this->PageConfigItems = $this->getTableLocator()->get('PageConfigItems');
        $this->SiteConfigs = $this->getTableLocator()->get('SiteConfigs');
        $this->Categories = $this->getTableLocator()->get('Categories');
        $this->Tags = $this->getTableLocator()->get('Tags');
        $this->InfoTags = $this->getTableLocator()->get('InfoTags');
        $this->InfoAppendItems = $this->getTableLocator()->get('InfoAppendItems');
        $this->AppendItems = $this->getTableLocator()->get('AppendItems');
        $this->MstLists = $this->getTableLocator()->get('MstLists');
        $this->UseradminSites = $this->getTableLocator()->get('UseradminSites');
        $this->InfoCategories = $this->getTableLocator()->get('InfoCategories');
        $this->InfoTops = $this->getTableLocator()->get('InfoTops');

        $this->loadComponent('OutputHtml');

        $this->modelName = 'Infos';
        $this->set('ModelName', $this->modelName);
    }


    public function beforeFilter(EventInterface $event)
    {
        $this->viewBuilder()->setLayout("user");
        $this->setCommon();
    }


    public function index()
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("index_2");
        $this->viewBuilder()->setClassName("Useradmin");

        $query = $this->_getQuery();
        $this->_setView($query);

        $this->setList();

        // slug
        $page_config_id = $query['sch_page_id'];

        $page_config = $this->PageConfigs->find()
            ->where(['PageConfigs.id' => $page_config_id])
            ->contain([
                'SiteConfigs' => function ($q) {
                    return $q->select('slug');
                },
                'PageConfigExtensions' => function ($q2) {
                    return $q2->where(['PageConfigExtensions.status' => 'publish'])->order(['PageConfigExtensions.position' => 'ASC']);
                }
            ])
            ->first();

        $preview_slug_dir = '';
        $page_title = '';
        if (!empty($page_config)) {
            $preview_slug_dir = $page_config->site_config->slug . DS . ($page_config->slug ? $page_config->slug . DS : '');
            $page_title = $page_config->page_title;
        } else {
            $preview_slug_dir = '';
        }

        $preview_slug_dir = str_replace('__', '/', $preview_slug_dir);

        // 現在カテゴリ情報
        $category = $this->Categories->find()->where(['Categories.id' => $query['sch_category_id']])->first();

        $pankuzu_category = [];
        $category_list = [];
        $is_data = true;

        if ($page_config->is_category == 'Y') {
            if ($page_config->is_category_multilevel == 1) {
                $_parent_id = $category->parent_category_id;
                $pankuzu_category[] = $category;
                do {
                    $tmp = $this->Categories->find()->where(
                        [
                            'Categories.page_config_id' => $query['sch_page_id'],
                            'Categories.id' => $_parent_id,
                        ]
                    )->first();
                    if (!empty($tmp)) {
                        $_parent_id = $tmp->parent_category_id;
                        $pankuzu_category[] = $tmp;
                    }
                } while (!empty($tmp));
                // 
                $category_cond = ['Categories.page_config_id' => $page_config_id];
                while ($pcat = array_pop($pankuzu_category)) {
                    $category_cond['Categories.parent_category_id'] = $pcat->parent_category_id;
                    $tmp = $this->Categories->find('list', ['keyField' => 'id', 'valueField' => 'name'])
                        ->where($category_cond)
                        ->order(['Categories.position' => 'ASC'])
                        ->all();
                    if ($tmp->isEmpty()) {
                        $tmp = null;
                    } else {
                        $category_list[] = [
                            'category' => $pcat,
                            'list' => $tmp->toArray(),
                            'empty' => false
                        ];
                    }
                }
                // 最後に現カテゴリに下層カテゴリがあれば追加
                $category_cond['Categories.parent_category_id'] = $category->id;
                $tmp = $this->Categories->find('list', ['keyField' => 'id', 'valueField' => 'name'])
                    ->where($category_cond)
                    ->order(['Categories.position' => 'ASC'])
                    ->all();
                if (!$tmp->isEmpty()) {
                    $category_list[] = [
                        'category' => (object)['id' => 0],
                        'list' => $tmp->toArray(),
                        'empty' => ['' => '選択してください']
                    ];
                    $is_data = false;
                }
            } else {
                $category_cond = ['Categories.page_config_id' => $page_config_id];
                $tmp = $this->Categories->find('list', ['keyField' => 'id', 'valueField' => 'name'])
                    ->where($category_cond)
                    ->order(['Categories.position' => 'ASC'])
                    ->all();
                if (!$tmp->isEmpty()) {
                    $category_list = $tmp->toArray();
                }
            }
        }

        // ページ設定拡張
        $list_buttons = [];
        $page_buttons = [
            'left' => [],
            'right' => []
        ];
        if (!empty($page_config->page_config_extensions)) {
            foreach ($page_config->page_config_extensions as $ex) {
                if ($ex->type == PageConfigExtension::TYPE_LIST_BUTTON) {
                    $list_buttons[] = $ex;
                } elseif ($ex->type == PageConfigExtension::TYPE_PAGE_BUTTON) {
                    $page_buttons[$ex->option_value][] = $ex;
                }
            }
        }

        $this->set(compact('list_buttons', 'page_buttons'));
        $this->set(compact('preview_slug_dir', 'page_title', 'query', 'page_config', 'category_list', 'is_data'));

        $cond = $this->_getConditions($query, $page_config);

        $contain = [
            'Categories',
            'InfoAppendItems' => function ($q) {
                return $q->contain(['AppendItems'])->order(['AppendItems.position' => 'ASC']);
            },
            'InfoTops'
        ];

        $page_slug = Inflector::camelize($page_config->slug);
        if (method_exists(get_class($this), 'readingConditionsHook' . $page_slug)) {
            $this->{'readingConditionsHook' . $page_slug}($query, $cond, $contain);
        }

        $order = [$this->modelName . '.position' => 'ASC'];

        // 親情報
        $parent_config = null;
        $parent_info = null;
        if ($page_config->parent_config_id) {
            $parent_config = $this->PageConfigs->find()->where(['PageConfigs.id' => $page_config->parent_config_id])->first();
            $parent_info = $this->Infos->find()->where(['Infos.id' => $query['parent_id']])->first();
        }
        $this->set(compact('parent_config', 'parent_info'));

        $options = [
            'order' => $order,
            'limit' => 20,
            'contain' => $contain
        ];

        if (method_exists(get_class($this), 'prependListsHook' . $page_slug)) {
            $options = $this->{'prependListsHook' . $page_slug}($query, $options);
        }
        parent::_lists($cond, $options);

        if (method_exists(get_class($this), 'readedIndexHook' . $page_slug)) {
            $this->{'readedIndexHook' . $page_slug}();
        }
    }


    protected function _getQueryIndex()
    {
        return $this->_getQuery();
    }


    protected function _getQuery()
    {
        $query = [];

        $query['sch_page_id'] = $this->request->getQuery('sch_page_id');
        $query['parent_id'] = $this->request->getQuery('parent_id');

        if (!$this->request->getQuery('sch_page_id') && $this->request->getQuery('page_slug')) {
            $page_config = $this->PageConfigs->find()->where(['PageConfigs.slug' => $this->request->getQuery('page_slug')])->first();
            if (!empty($page_config)) {
                $query['sch_page_id'] = $page_config->id;
            }
        }

        if (!$query['sch_page_id']) {
            $this->redirect('/user_admin/');
        }

        $query['sch_category_id'] = $this->request->getQuery('sch_category_id');
        if (!$query['sch_category_id']) {
            if ($this->isCategorySort($query['sch_page_id'])) {
                $category = $this->Categories->find()->where(['Categories.page_config_id' => $query['sch_page_id']])->order(['Categories.position' => 'ASC'])->first();
                if (!empty($category)) {
                    $query['sch_category_id'] = $category->id;
                }
            } else {
                $query['sch_category_id'] = 0;
            }
        }
        $query['sch_status'] = $this->request->getQuery('sch_status');
        $query['sch_words'] = $this->request->getQuery('sch_words');

        $query['pos'] = $this->request->getQuery('pos');
        if (empty($query['pos'])) {
            $query['pos'] = 0;
        }

        $query['page'] = $this->request->getQuery('page');
        if (empty($query['page'])) {
            unset($query['page']);
        }

        $this->GQuery = $query;

        return $query;
    }


    private function _getConditions($query, $page_config = null)
    {
        $cond = [];
        $cnt = 0;

        $cond[$cnt++]['Infos.page_config_id'] = $query['sch_page_id'];

        if ($query['sch_category_id']) {
            if (!empty($page_config->is_category_multiple) && $page_config->is_category_multiple == 1) {
                $info_categories = $this->InfoCategories->find()->where(['InfoCategories.category_id' => $query['sch_category_id']])->extract('info_id');
                $info_ids = [0];
                if (!$info_categories->isEmpty()) {
                    $info_ids = $info_categories->toArray();
                }
                $cond[$cnt++]['Infos.id in'] = $info_ids;
            } else {
                $cond[$cnt++]['Infos.category_id'] = $query['sch_category_id'];
            }
        }

        if ($query['sch_status']) {
            $now = new \DateTime();
            if ($query['sch_status'] == 'waiting_pl') {
                $query['sch_status'] = 'publish';

                $cond[$cnt++]['Infos.date >'] = $now->format('Y-m-d 00:00');
            } elseif ($query['sch_status'] == 'publish') {
                $cond[$cnt++]['Infos.date <='] = $now->format('Y-m-d 00:00');
            }
            $cond[$cnt++]['Infos.status'] = $query['sch_status'];
        }

        if ($query['sch_words']) {
            $query['sch_words'] = str_replace('　', ' ', trim($query['sch_words']));
            $words = explode(' ', $query['sch_words']);
            if (!empty($words)) {
                foreach ($words as $w) {
                    $info_ids = [0];
                    // 追加項目
                    $append_cond = [
                        ['AppendItems.page_config_id' => $page_config->id],
                        ['OR' => [
                            ['InfoAppendItems.value_textarea like' => "%{$w}%"],
                            ['InfoAppendItems.value_text like' => "%{$w}%"]
                        ]]
                    ];
                    $appends = $this->InfoAppendItems->find()->where([$append_cond])->contain(['AppendItems'])->extract('info_id');
                    if ($appends->count()) {
                        $info_ids = $appends->toArray();
                    }

                    // if (empty($info_total_ids)) {
                    //     $info_total_ids = $info_ids;
                    // }
                    // $info_total_ids = array_intersect($info_total_ids, $info_ids);

                    // コンテンツ
                    $sub_cond = [
                        ['OR' => [
                            ['Infos.title like' => "%{$w}%"],
                            ['InfoContents.title like' => "%{$w}%"],
                            ['InfoContents.content like' => "%{$w}%"]
                        ]]
                    ];
                    $sub_contents = $this->InfoContents->find()->where($sub_cond)->contain(['Infos'])->all();
                    if (!$sub_contents->isEmpty()) {
                        $info_ids += $sub_contents->extract('info_id')->toArray();
                    }

                    if (empty($info_total_ids)) {
                        $info_total_ids = $info_ids;
                    }
                    $info_total_ids = array_intersect($info_total_ids, $info_ids);
                }

                if (empty($info_total_ids)) {
                    $info_total_ids = [0];
                }
                $cond[$cnt++]['Infos.id in'] = array_unique($info_total_ids);
            }
        }

        if ($query['parent_id']) {
            $cond[$cnt++]['Infos.parent_info_id'] = $query['parent_id'];
        }


        return $cond;
    }


    public function edit($id = 0)
    {
        $this->checkLogin();
        $this->viewBuilder()->setLayout("edit");
        $this->viewBuilder()->setClassName("Useradmin");

        $validate = 'default';

        if ($id && !$this->isOwnInfoByUser($id)) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user_admin/');
            return;
        }

        $query = $this->_getQuery();
        $sch_page_id = $query['sch_page_id'];

        $this->setList();

        $options = [
            // 'saveAll' => ['associated' => ['InfoContents']], // save時使用
            'contain' => [
                'InfoContents' => function ($q) {
                    return $q->order('InfoContents.position ASC')->contain(['SectionSequences', 'MultiImages']);
                },
                'InfoTags' => function ($q) {
                    return $q->contain(['Tags'])->order(['Tags.position' => 'ASC']);
                },
                'InfoAppendItems' => function ($q) {
                    return $q->find('myFormat')->contain(['AppendItems'])->order(['AppendItems.position' => 'ASC']);
                },
                'InfoCategories',
                // 'Services'
            ] // find時使用
        ];

        $page_config = $this->PageConfigs->find()->where(['PageConfigs.id' => $sch_page_id])->first();
        $page_title = $page_config->page_title;

        $parent_config = $page_config->parent_config_id ? $this->PageConfigs->find()->where(['PageConfigs.id' => $page_config->parent_config_id])->first() : null;
        $parent_info = $parent_config ? $this->Infos->find()->where(['Infos.id' => $query['parent_id']])->first() : null;
        $this->set(compact('parent_info', 'parent_config'));

        // カテゴリリスト
        $category_list = $this->Categories->find('list', ['keyField' => 'id', 'valueField' => 'name'])
            ->where(['Categories.page_config_id' => $sch_page_id])
            ->order(['Categories.position' => 'ASC'])
            ->toArray();

        // 追加入力項目
        $append_list = $this->AppendItems->find()
            ->where(['page_config_id' => $sch_page_id])
            ->order('position asc')
            ->all()
            ->toArray();

        $append_item_list = $this->getAppendList($sch_page_id);

        $this->set(compact('page_title', 'query', 'page_config', 'category_list', 'append_list', 'append_item_list'));

        if ($this->request->is(['post', 'put'])) {

            $data = $this->request->getData();
            $data['page_config_id'] = $sch_page_id;
            // $data['top_slide'] = $data['top_slide'][0];

            $info_category_ids = $this->request->getData('info_categories');

            // createの場合
            if ($this->request->is(['post'])) $validate = 'Create';

            // ブロック追加の並び順
            if (isset($data['info_contents'])) {
                $pos = 0;
                $img_index = 0;
                foreach ($data['info_contents'] as $k => $v) {
                    $data['info_contents'][$k]['position'] = $pos + 1;

                    if (isset($data['__image__'][$k]) && !empty($data['__image__'][$k]) && intval($data['info_contents'][$k]['block_type']) == 18) {

                        foreach ($data['__image__'][$k] as $img) {
                            if ($img->getError()) continue;

                            $data['info_contents'][$k]['multi_images'][] = ['image' => $img];
                        }
                    }
                    $pos++;
                }
            }

            // メタキーワード
            $_keywords = $this->request->getData('keywords');
            $meta_keywords = '';

            if ($_keywords) {
                $pre = '';
                foreach ($_keywords as $k => $v) {
                    $v = strip_tags(trim($v));
                    if (!empty($v)) {
                        $meta_keywords .= $pre . $v;
                        $pre = ',';
                    }
                }
            }
            $data['meta_keywords'] = $meta_keywords;

            // infoAppendItemsがある場合
            if (isset($data['info_append_items'])) {
                foreach ($data['info_append_items'] as $ap_num => $i_append_item)
                    // 必須でないリスト対策
                    if (empty($i_append_item['value_int']))
                        $data['info_append_items'][$ap_num]["value_int"] = 0;
            }

            $delete_ids = $this->request->getData('delete_ids');
            $delete_ids_multi_image = $this->request->getData('delete_ids_multi_image');
            $tags = $this->request->getData('tags');

            $options['callback'] = function ($id) use ($delete_ids, $tags, $page_config, $info_category_ids, $delete_ids_multi_image) {
                $r = true;
                // コンテンツ削除
                if ($id && $delete_ids) {
                    $sub_delete_ids = [];
                    foreach ($delete_ids as $del_id) {
                        $sub_delete_ids = $this->content_delete($id, $del_id);
                        // 枠ごと削除した場合の中身のコンテンツ削除
                        foreach ($sub_delete_ids as $sub_del_id) {
                            $this->content_delete($id, $sub_del_id);
                        }
                    }
                }

                // 枠の紐付け
                $info_contents = $this->InfoContents->find()
                    ->where(['InfoContents.info_id' => $id])
                    ->order(['position' => 'ASC'])
                    ->all()
                    ->toArray();

                foreach ($info_contents as $v) {
                    if (isset(Info::BLOCK_TYPE_WAKU_LIST[(int)$v['block_type']])) {

                        $section_query = $this->SectionSequences->find()
                            ->where(['SectionSequences.id' => $v['section_sequence_id']])
                            ->first();

                        if (is_null($section_query)) continue;

                        $section_query->info_content_id = $v['id'];
                        $this->SectionSequences->save($section_query);
                    }
                }

                // タグ
                $tag_ids = $this->saveTags($page_config->id, $tags); // マスターの登録
                foreach ($tag_ids as $tag_id) {

                    $info_tag = $this->InfoTags->find()
                        ->where(['InfoTags.tag_id' => $tag_id, 'InfoTags.info_id' => $id])
                        ->first();

                    if (is_null($info_tag)) {
                        $info_tag = $this->InfoTags->newEntity([]);
                        $info_tag->info_id = $id;
                        $info_tag->tag_id = $tag_id;
                        $this->InfoTags->save($info_tag);
                    }
                }

                // タグの削除
                $this->InfoTags->deleteAll(empty($tag_ids) ? ['InfoTags.info_id' => $id] : ['InfoTags.info_id' => $id, 'InfoTags.tag_id not in' => $tag_ids]);

                if (!empty($delete_info_cate_ids)) {
                    $delete_info_cate_ids = array_values($delete_info_cate_ids);
                    $this->InfoCategories->deleteAll(['InfoCategories.info_id' => $id, 'InfoCategories.id in' => $delete_info_cate_ids]);
                }

                // 複数カテゴリ
                if ($page_config->is_category == 'Y' && $page_config->is_category_multiple == 1) {
                    $this->InfoCategories->deleteAll(['InfoCategories.info_id' => $id, 'InfoCategories.id not in ' => $info_category_ids]);

                    if (!empty($info_category_ids)) {
                        foreach ($info_category_ids as $cat_id) {

                            $info_cate = $this->InfoCategories->find()
                                ->where(['InfoCategories.info_id' => $id, 'InfoCategories.category_id' => $cat_id])
                                ->first();

                            if (empty($info_cate)) {
                                $info_cate = $this->InfoCategories->newEntity([]);
                                $info_cate->info_id = $id;
                                $info_cate->category_id = $cat_id;
                                $this->InfoCategories->save($info_cate);
                            }
                        }
                    }
                }

                $manyImages = $this->fetchTable('MultiImages');
                if (!empty($delete_ids_multi_image))
                    $manyImages->deleteMany($manyImages->find()->where(['id IN' => $delete_ids_multi_image])->all());

                return $r;
            };

            $this->request = $this->request->withParsedBody($data);
        } else
            $info_category_ids = $this->getCategoryIds($id);


        $this->set(compact('info_category_ids'));

        $options['append_validate'] = function ($isValid, $entity) use ($page_config) {
            // infoAppendItemsのバリデーション
            if (is_null($entity->info_append_items) || empty($entity->info_append_items)) return true;

            $val_iAItems = $this->validInfoAppendItems($entity, $page_config);
            if (!$val_iAItems) {
                $isValid = false;
            }
            return $isValid;
        };

        $options['associated'] = ['InfoAppendItems', 'InfoContents.MultiImages'];
        $options['redirect'] = ['action' => 'index', '?' => $query];
        $options['validate'] = $validate;

        parent::_edit($id, $options);
    }


    public function delete($id, $type, $columns = null)
    {
        $this->checkLogin();

        if (!$this->isOwnInfoByUser($id)) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user_admin/');
            return;
        }

        $query = $this->_getQueryIndex();

        $options = [];

        $data = $this->Infos->find()
            ->where(['Infos.id' => $id])
            ->contain([
                'PageConfigs' => function ($q) {
                    return $q->select(['slug', 'site_config_id', 'page_title']);
                },
                'InfoAppendItems',
                'InfoContents',
                'InfoCategories'
            ])
            ->first();
        if (empty($data)) {
            $this->redirect(['action' => 'index']);
            return;
        }
        if ($type == 'content') {
            $options['redirect'] = ['action' => 'index', '?' => $query];
            $slug = Inflector::camelize($data->page_config->slug);
            if (method_exists(get_class($this), 'deletedRedirectHook' . $slug)) {
                $options['redirect'] = $this->{'deletedRedirectHook' . $slug}();
            }
        } else {
            $options['redirect'] = ['action' => 'edit', $id, '?' => $query];
        }
        if ($type == "content") {
            if (!empty($data->info_append_items)) {
                foreach ($data->info_append_items as $sub) {
                    $this->append_delete($id, $sub->id);
                }
            }

            if (!empty($data->info_contents)) {
                foreach ($data->info_contents as $sub) {
                    $this->content_delete($id, $sub->id);
                }
            }

            if (!empty($data->info_categories)) {
                foreach ($data->info_categories as $sub) {
                    $this->InfoCategories->delete($sub);
                }
            }
        }

        parent::_delete($id, $type, $columns, $options);
    }


    public function position($id, $pos)
    {
        $this->checkLogin();

        if (!$this->isOwnInfoByUser($id)) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user/');
            return;
        }

        $query = $this->_getQueryIndex();

        $options = [];

        $data = $this->Infos->find()->where(['Infos.id' => $id])->first();
        if (empty($data)) {
            $this->redirect(['action' => 'index']);
            return;
        }

        if (!$this->isCategorySort($data->page_config_id)) {
            unset($query['sch_category_id']);
            $options['is_category_sort'] = false;
        }
        $options['redirect'] = ['action' => 'index', '?' => $query];

        return parent::_position($id, $pos, $options);
    }


    public function resetPosition()
    {
        $this->_getQuery();

        $model = $this->Infos;
        $position = 1;

        $conditions = ['page_config_id' => $this->GQuery['sch_page_id']];

        $data = $model->find()
            ->where($conditions)
            ->order(['id DESC'])
            ->toArray();

        foreach ($data as $value) {
            $conditions['id'] = $value['id'];
            $model->updateAll(['position' => $position], $conditions);
            ++$position;
        }

        $this->redirect(['action' => 'index', '?' => $this->GQuery]);
    }


    public function enable($id)
    {
        $this->checkLogin();

        if (!$this->isOwnInfoByUser($id)) {
            $this->Flash->set('不正なアクセスです');
            $this->redirect('/user_admin/');
            return;
        }

        $options = [];

        $data = $this->Infos->find()->where(['Infos.id' => $id])->contain(['PageConfigs'])->first();
        if (empty($data)) {
            $this->redirect(['action' => 'index']);
            return;
        }

        $page_config_id = $this->request->getQuery('sch_page_id');
        $category_id = $this->request->getQuery('sch_category_id');
        $pos = $this->request->getQuery('pos');
        $page = $this->request->getQuery('page');
        if (empty($pos)) {
            $pos = 0;
        }

        if ($this->isCategoryEnabled($data->page_config) && $data->category_id == 0 && $data->status == 'draft' && $data->page_config->is_category_multiple == 0) {
            $this->Flash->set('カテゴリが未設定の記事は公開できません');
            $this->redirect(['action' => 'index', '?' => ['sch_page_id' => $page_config_id, 'sch_category_id' => $category_id]]);
            return;
        }

        $query = $this->_getQuery();

        $options['redirect'] = ['action' => 'index', '?' => $query];

        $page_slug = Inflector::camelize($data->page_config->slug);
        if (method_exists(get_class($this), 'prependEnableHook' . $page_slug)) {
            $options = $this->{'prependEnableHook' . $page_slug}($data, $options);
        }

        parent::_enable($id, $options);

        if (method_exists(get_class($this), 'changedStatusHook' . $page_slug)) {
            $this->{'changedStatusHook' . $page_slug}($data);
        }
    }


    public function setList()
    {

        $list = [];
        $list['_main'] = $this->PageConfigItems
            ->find('all')
            ->where([
                'page_config_id' => $this->GQuery['sch_page_id'],
                'parts_type' => 'main',
            ])
            ->contain(['PageConfigs'])
            ->order(['PageConfigItems.position' => 'ASC'])
            ->toArray();

        $list['_content'] = $this->PageConfigItems
            ->find('all')
            ->where([
                'page_config_id' => $this->GQuery['sch_page_id'],
                'parts_type' => 'block',
                'status' => 'Y',
            ])
            ->contain(['PageConfigs'])
            ->order(['PageConfigItems.position' => 'ASC'])
            ->toArray();

        $list['_waku'] = $this->PageConfigItems
            ->find()
            ->where([
                'page_config_id' => $this->GQuery['sch_page_id'],
                'parts_type' => 'section',
                'status' => 'Y',
            ])
            ->contain(['PageConfigs'])
            ->first();

        $list['_appendItem'] = $this->AppendItems
            ->find('all')
            ->where(['page_config_id' => $this->GQuery['sch_page_id']])
            ->contain(['PageConfigs', 'MstLists'])
            ->order(['AppendItems.position' => 'ASC'])
            ->toArray();

        // ブロック
        $list['block_type_list'] = $list['_content'];

        // 枠ブロック
        $block_type_waku_list = Info::getBlockTypeList('waku');

        $list['block_type_waku_list'] = $block_type_waku_list;
        $list['font_list'] = Info::$font_list;

        $current_site_id = $this->Session->read('current_site_id');
        $list['page_config_list'] = $this->PageConfigs->find('list', ['keyField' => 'id', 'valueField' => 'page_title'])->where(['PageConfigs.site_config_id' => $current_site_id])->toArray();

        $list['out_waku_list'] = Info::$out_waku_list;
        $list['line_style_list'] = Info::$line_style_list;
        $list['line_color_list'] = Info::$line_color_list;
        $list['line_width_list'] = Info::$line_width_list;
        $list['waku_style_list'] = Info::$waku_style_list;
        $list['waku_color_list'] = Info::$waku_color_list;
        $list['waku_bgcolor_list'] = Info::$waku_bgcolor_list;
        $list['button_color_list'] = Info::$button_color_list;
        $list['content_liststyle_list'] = Info::$content_liststyle_list;
        $list['link_target_list'] = Info::$link_target_list;

        $list['placeholder_list'] = AppendItem::$placeholder_list;
        $list['notes_list'] = AppendItem::$notes_list;

        if (!empty($list)) {
            $this->set(array_keys($list), $list);
        }

        $PageConfig = new PageConfig;
        $this->set('PageConfig', $PageConfig);

        $this->list = $list;
        return $list;
    }


    public function addRow()
    {
        $this->viewBuilder()->setLayout("plain");

        // $this->setList();

        $rownum = $this->request->getData('rownum');
        $slug = $this->request->getData('slug');
        $info_id = $this->request->getData('info_id');
        $data['block_type'] = $this->request->getData('block_type');

        $entity = $this->InfoContents->newEntity($data);
        $entity->id = null;
        $entity->position = 0;
        $entity->block_type = $data['block_type'];
        $entity->section_sequence_id = 0;
        $entity->option_value = "";
        $entity->option_value2 = "";
        $entity->option_value3 = "";
        $entity->image_pos = "";
        $entity->title = "";
        $entity->slug = $slug;
        $entity->info_id = $info_id;

        if ($this->request->getData('section_no'))
            $entity->section_sequence_id = $this->request->getData('section_no');

        if (isset(Info::BLOCK_TYPE_WAKU_LIST[$data['block_type']])) {
            $entity->section_sequence_id = $this->SectionSequences->createNumber();

            if (isset(Info::$option_default_values[$data['block_type']]))
                $entity->option_value = Info::$option_default_values[$data['block_type']];
        }

        if ($data['block_type'] == Info::BLOCK_TYPE_SECTION_WITH_IMAGE)
            $entity->image_pos = 'left';

        $datas = $entity->toArray();

        $this->set(compact('rownum', 'datas'));
    }


    public function addTag()
    {
        $this->viewBuilder()->setLayout("plain");

        $num = $this->request->getData('num');
        $tag = $this->request->getData('tag');
        $tag = strip_tags(trim($tag));
        $this->set(compact('tag', 'num'));
    }


    private function content_delete($id, $del_id)
    {
        $e = $this->InfoContents->find()
            ->where(['InfoContents.id' => $del_id, 'InfoContents.info_id' => $id])
            ->first();

        if (is_null($e)) return [];

        $image_index = array_keys($this->InfoContents->attaches['images']);
        $file_index = array_keys($this->InfoContents->attaches['files']);

        if (isset($e->attaches) && !is_null($e->attaches) && !empty($e->attaches)) {
            foreach ($image_index as $idx) {
                foreach ($e->attaches[$idx] as $_) {
                    $_file = WWW_ROOT . $_;
                    if (is_file($_file)) {
                        @unlink($_file);
                    }
                }
            }

            foreach ($file_index as $idx) {
                if (!isset($e->attaches[$idx][0])) continue;
                $_file = WWW_ROOT . $e->attaches[$idx][0];
                if (is_file($_file)) {
                    @unlink($_file);
                }
            }
        }

        $this->InfoContents->delete($e);

        $sub_delete_ids = [];

        if (isset(Info::BLOCK_TYPE_WAKU_LIST[$e->block_type]) && $e->section_sequence_id > 0) {
            $sub_delete_ids = $this->InfoContents->find()
                ->where(
                    [
                        'InfoContents.section_sequence_id' => $e->section_sequence_id,
                        'InfoContents.id !=' => $del_id,
                        'InfoContents.info_id' => $id
                    ]
                )
                ->extract('id');
        }

        return $sub_delete_ids;
    }


    public function toHierarchization($id, $entity, $options = [])
    {
        // 枠ブロックとして認識させる番号を指定
        $options['section_block_ids'] = array_keys(Info::BLOCK_TYPE_WAKU_LIST);
        return parent::toHierarchization($id, $entity, $options);
    }


    private function saveTags($page_config_id, $tags)
    {
        $ids = [];
        $tags = $tags ?? [];

        foreach ($tags as $t) {
            $tag = strip_tags(trim($t['tag']));

            $entity = $this->Tags->find()
                ->where(['Tags.tag' => $tag, 'Tags.page_config_id' => $page_config_id])
                ->first();

            if (is_null($entity)) {
                $entity = $this->Tags->newEntity([]);
                $entity->tag = $tag;
                $entity->status = 'publish';
                $entity->page_config_id = $page_config_id;

                $this->Tags->save($entity);
            }
            $ids[] = $entity->id;
        }

        return $ids;
    }


    public function popTaglist()
    {
        $this->viewBuilder()->setLayout("pop");

        $page_config_id = $this->request->getQuery('page_config_id');

        $cond = [
            'Tags.page_config_id' => $page_config_id
        ];

        $query = $this->Tags->find();
        $sql = $query->select(['id', 'tag', 'cnt' => $query->func()->count('InfoTags.id')])
            ->where($cond)
            ->leftJoinWith('InfoTags')
            ->group('Tags.id')
            // ->enableAutoFields(true)
            ->order(['cnt' => 'DESC']);

        $this->modelName = 'Tags';
        $this->_lists($cond, [
            'limit' => 10,
            'order' => ['Tags.position' => 'ASC'],
            'sql_query' => $sql
        ]);
    }


    public function distAttachmentCopy($id)
    {

        if ($this->Infos->getTable() !== 'infos') {
            return;
        }
        if ($this->InfoContents->getTable() !== 'info_contents') {
            return;
        }

        $_data = $this->Infos->find()->where(['Infos.id' => $id])->contain(['InfoContents'])->first();

        if (!$id || empty($_data)) {
            return;
        }

        $this->Infos->copyPreviewAttachement($_data->id, 'PreviewInfos');

        foreach ($_data->info_contents as $content) {
            $this->InfoContents->copyPreviewAttachement($content->id, 'PreviewInfoContents');
        }

        return;
    }


    protected function getAppendList($config_id = 0, $list_bool = false)
    {
        $list = [];

        if (empty($config_id)) {
            return $list;
        }

        if ($list_bool) {
            $append_datas = $this->MstLists->find('list', [
                'keyField' => 'ltrl_cd',
                'valueField' => 'ltrl_val'
            ])
                ->order(['MstLists.position' => 'ASC'])
                ->toArray();
        } else {
            $append_datas = $this->MstLists->find()
                ->order(['MstLists.position' => 'ASC'])
                ->toArray();
        }

        if (empty($append_datas)) {
            return $list;
        }

        if ($list_bool) {
            return $append_datas;
        }

        foreach ($append_datas as $n => $_) {
            $list[$_['slug']][$_['ltrl_cd']] = $_['ltrl_val'];
        }

        return $list;
    }


    /**
     * Undocumented function
     *
     * @param [type] $data formの元データ
     * @param [type] $page_config
     * @return bool
     */
    protected function validInfoAppendItems($data, $page_config)
    {
        $valid = false;

        // 追加バリデーション用id-slugリスト
        $append_for_additional_list = $this->AppendItems->find('list', [
            'keyField' => 'id',
            'valueField' => 'slug'
        ])
            ->toArray();


        // 必須項目リストの取得
        $contain = ['PageConfigs'];
        $cond = [
            'AppendItems.page_config_id' => $page_config->id,
            'AppendItems.is_required' => 1
        ];

        $require_append_list = $this->AppendItems->find()
            ->contain($contain)
            ->where($cond)
            ->order(['AppendItems.position' => 'ASC'])
            ->toArray();

        // empty以外のバリデーションチェック 
        if (empty($require_append_list)) {

            foreach ($data->info_append_items as $n => $item) {
                $r = $this->additionalValidate($data, $item, $append_for_additional_list, $page_config->slug);
                if (!$r) return false;
            }
            return true;
        }
        // [id => data],['slug' => id]化
        $r_list = [];
        $r_slug_list = [];
        foreach ($require_append_list as $ap) {
            $r_list[$ap->id] = $ap;
            $r_slug_list[$ap->slug][] = $ap->id;
        }

        $check_valid = [];
        foreach ($data->info_append_items as $n => $item) {
            if (isset($r_list[$item->append_item_id])) {
                // 項目別チェック
                $r = $this->validWithType($data, $item, $r_list[$item->append_item_id], $n);
                $check_valid[] = $r;

                if ($r && !empty($append_for_additional_list)) {
                    // 追加項目に対して個別のバリデーションを入れたければユニークとなるslugを設定しここで記載
                    $check_valid[] = $this->additionalValidate($data, $item, $append_for_additional_list, $page_config->slug);
                }
            }
        }

        return (!in_array(false, $check_valid, true));
    }


    /**
     * Undocumented function
     *
     * @param [type] $entity formの元データ
     * @param [type] $data 評価中のinfo_append_itemデータ
     * @param [type] $append 評価中のappend_item項目データ
     * @param [type] $list append_itemの[slug,id]リスト
     * @param [type] $slug page_config->slug
     * @return bool
     */
    protected function validWithType($entity, $data, $append, $num)
    {
        $valid = true;

        // Date型 // DateTime型
        if (in_array($append->item_type, ['date', 'datetime'], true))
            $valid = $data->{$append->slug} instanceof \DateTime || $data->{$append->slug} instanceof \Cake\I18n\FrozenDate;

        // Text型 // Textarea型 // WYSIWYG型
        if (in_array($append->item_type, ['text', 'textarea', 'WYSIWYG'], true))
            $valid = $data->{$append->slug} != '';

        // Image型
        if (in_array($append->item_type, ['image'], true))
            $valid = $data->{$append->slug} != '' || $data->{__('_{0}', $append->slug)}->getError() == 0;

        // File型
        if (in_array($append->item_type, ['file'], true))
            $valid = $data->{$append->slug} != '' || $data->{__('_{0}', $append->slug)}->getError() == 0;

        // select型 // checkbox型 // radio型
        // if (in_array($append->item_type, ['select', 'checkbox', 'radio'], true))
        //     $valid = $data->{$append->slug} != '' || !is_null($data->{$append->slug}) || $data->{$append->slug} != 0; 

        // エラーメッセージセット
        if (!$valid) {
            $error = ['notempty' => '選択してください'];
            if (in_array($append->item_type, ['WYSIWYG', 'text', 'textarea'], true))
                $error['notempty'] = '入力してください';

            $data->setError(__('{0}', $append->slug), [$error]);
        }
        return $valid;
    }


    /**
     * emptyチェック以外のバリデーション(append項目)
     * @param [type] $entity formの元データ
     * @param [type] $data 評価中のinfo_append_itemデータ
     * @param [type] $list append_itemsのid-slugリスト
     * @param [type] $slug page_config->slug
     * @return bool
     */

    protected function additionalValidate($entity, $data, $list, $slug)
    {
        $valid = true;
        // $append_slug = $list[$data->append_item_id];

        // if ($slug == 'glossaries') {
        //     if ($append_slug == 'kana') {
        //         if (!empty($data['value_text'])) {
        //             if (!$this->InfoAppendItems->checkKana($data['value_text'])) {
        //                 $valid = false;
        //                 $entity->setErrors([
        //                     "{$slug}.{$append_slug}" => [
        //                         'checkurl' => '全角カタカナで入力してください'
        //                     ]
        //                 ]);
        //             }
        //         }
        //     }
        // }
        return $valid;
    }


    private function append_delete($id, $del_id)
    {
        $q = $this->InfoAppendItems->find()->where(['InfoAppendItems.id' => $del_id, 'InfoAppendItems.info_id' => $id]);
        $e = $q->first();

        $image_index = array_keys($this->InfoAppendItems->attaches['images']);
        $file_index = array_keys($this->InfoAppendItems->attaches['files']);

        foreach ($image_index as $idx) {
            if (!empty($e[$idx])) {
                foreach ($e->attaches[$idx] as $_) {
                    $_file = WWW_ROOT . $_;
                    if (is_file($_file)) {
                        @unlink($_file);
                    }
                }
            }
        }
        foreach ($file_index as $idx) {
            if (!empty($e[$idx])) {
                $_file = WWW_ROOT . $e->attaches[$idx][0];
                if (is_file($_file)) {
                    @unlink($_file);
                }
            }
        }

        return $this->InfoAppendItems->delete($e);
    }


    private function getCategoryIds($id = 0)
    {
        $list = [];
        $i_cates = $this->InfoCategories->find()
            ->where(['info_id' => $id])
            ->extract('category_id');
        $list = [];
        if ($i_cates->count()) {
            $list = $i_cates->toArray();
        }
        return array_values($list);
    }
}
