<?php $this->start('css') ?>
<script src="/user/common/js/ckeditor.js"></script>
<script src="/user/common/js/ja.js"></script>
<?php $this->end('css') ?>


<main id="main">

    <div id="toolbar-container"></div>
    <div id="editor" style="border: 1px solid #ccc !important;"></div>
    <?= $this->Form->textarea('content', ['hidden' => 'hidden', 'id' => 'event-content', 'error' => false]); ?>
    <?php if ($this->Form->isFieldError('content')) : ?>
        <div class="error-message">
            <div class="error-message"><?= $this->Form->error('content') ?></div>
        </div>
    <?php endif ?>

</main>
<?php $this->start('script') ?>
<?= $this->Html->script([
    "/user/common/js/jquery-ui-1.9.2.custom.min.js",
    "/user/common/js/jquery.ui.datepicker-ja",
]); ?>
<script>
    function kakunin(msg, url) {
        if (confirm(msg)) {
            location.href = url;
        }
    }

    function __uploadFile(files, editor, htmlDP) {
        var fd = new FormData();

        if (files.length > 10) {
            alert('最大１０ファイルまでしかアップロードできません。');
            return false;
        }

        var total_size = 0;
        var is_check_size = false;

        for (let i = 0; i < files.length; i++) {
            const __size = (files[i].size / 1024 / 1024).toFixed(2);
            total_size += parseFloat(__size);

            if (__size > 32 || total_size > 32) {
                is_check_size = true;
                break;
            }
            fd.append('files[]', files[i]);
        };

        if (is_check_size) {
            alert('総容量は３２MBが超えました。');
            return false;
        }

        return $.ajax({
            'url': "/userAdmin/user-sites/upload-files",
            'contentType': false,
            'processData': false,
            'method': 'post',
            'data': fd,
            'dataType': 'json',
            'success': function(resp) {
                // response型
                // {
                //     success: true / false,
                //     data: [{
                //             original_name: 'オリジナルファイル名',
                //             url: '保存されたファイルのパス'
                //         },
                //         ...
                //     ]
                // }

                for (let i = 0; i < resp.data.length; i++) {
                    editor.model.change(writer => {
                        editor.model.insertContent(
                            // a tag
                            writer.createText(resp.data[i].original_name, {
                                linkHref: resp.data[i].url
                            }),
                            // Ckeditor内に追加するPosition
                            editor.model.document.selection
                        );
                    });
                }

            }
        });
    }


    function uploadFile(e) {
        var fd = new FormData();
        var files = $(e)[0].files;

        $(e).parent('td').find('.error-message').remove();

        if (files.length > 10) {
            $(e)
                .parent('td')
                .append(`<div class="error-message">
                <div class="error-message">最大１０ファイルまでしかアップロードできません。</div>
            </div>`);

            return false;
        }

        var total_size = 0;

        var is_check_size = false;

        for (let i = 0; i < files.length; i++) {
            const __size = (files[i].size / 1024 / 1024).toFixed(2);
            total_size += parseFloat(__size);

            if (__size > 32 || total_size > 32) {
                is_check_size = true;
                break;
            }
            fd.append('files[]', files[i]);
        };

        if (is_check_size) {
            $(e)
                .parent('td')
                .append(`<div class="error-message">
                <div class="error-message">総容量は３２MBが超えました。</div>
            </div>`);

            return false;
        }
        // ... check size and max file on server ...
        $.ajax({
            'url': "/userAdmin/user-sites/upload-files",
            'contentType': false,
            'processData': false,
            'method': 'post',
            'data': fd,
            'dataType': 'json',
            'success': function(resp) {
                if (resp.success) {
                    for (let i = 0; i < resp.data.length; i++)
                        $(e).parent('td').append(`
                        <p class="row_file">
                            <a class="is_file ${resp.data[i].class}" href="${resp.data[i].url}" target="_blank">${resp.data[i].original_name}</a>
                            <span onclick="removeFile(this)">X</span>
                            <input type="hidden" name="__files[${resp.data[i].original_name}]" value="${resp.data[i].url}"/>
                        </p>
                        `);
                }
            }
        });
    }


    function removeFile(e) {
        $(e).parents('p').remove();
    }


    $(function() {
        $.datetimepicker.setLocale('ja');
        $('.datetime_picker').datetimepicker({
            format: 'Y-m-d H:i',
            step: 30,
        });
        $('.date_picker').datepicker({
            dateFormat: 'yy-mm-dd'
        });

        /**
         * CKeditor 設定
         */
        DecoupledEditor
            .create(document.querySelector('#editor'), {
                toolbar: {
                    items: [
                        'heading',
                        '|',
                        'fontsize', 'fontColor', 'fontBackgroundColor',
                        '|',
                        'bold', 'italic', 'underline', 'strikethrough',
                        '|',
                        'alignment',
                        '|',
                        'numberedList', 'bulletedList',
                        '|',
                        'outdent', 'indent',
                        '|',
                        'link', 'blockquote', 'uploadImage', 'insertTable', 'mediaEmbed', 'insertFile',
                        '|',
                        'undo', 'redo'
                    ]
                },
                // 言語　（include ja.js　ファイル）
                language: 'ja',

                // イメージアップロードの設定
                simpleUpload: {
                    // response型
                    // {
                    //     success: true / false,
                    //     data: [{
                    //             original_name: 'オリジナルファイル名',
                    //             url: '保存されたファイルのパス',
                    //             element: バリューは任意ですが必ず返す,
                    //         },
                    //         ...
                    //     ]
                    // }
                    uploadUrl: '/userAdmin/user-sites/upload-image-event',
                    withCredentials: true,
                    headers: {
                        // フォームの「csrfToken」Input Hiddenのバリューと同じ
                        'X-CSRF-TOKEN': csrfToken
                    }
                },

                // 動画の設定
                mediaEmbed: {
                    // 表側Playボタン押せるため
                    previewsInData: true,
                    // ↓の社会からの動画なら、追加できないよう
                    removeProviders: ['instagram', 'twitter', 'googleMaps', 'flickr', 'facebook']
                },

                // フォントサイズ設定
                fontSize: {
                    options: ['default',
                        14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
                    ]
                },

                // a タグの設定
                link: {
                    // attr target＝＿blank
                    addTargetToExternalLinks: true,

                    // 自動Detect Url
                    decorators: {
                        detectFilePdf: {
                            mode: 'automatic',
                            callback: url => url.endsWith('.pdf'),
                            attributes: {
                                class: 'is_file pdf',
                                target: '_blank'
                            }
                        },
                        detectFileWord: {
                            mode: 'automatic',
                            callback: url => url.endsWith('.doc') || url.endsWith('.docx'),
                            attributes: {
                                class: 'is_file doc',
                            }
                        },
                        detectFileXls: {
                            mode: 'automatic',
                            callback: url => url.endsWith('.xls') || url.endsWith('.xlsx'),
                            attributes: {
                                class: 'is_file xls',
                            }
                        },
                        detectFileCsv: {
                            mode: 'automatic',
                            callback: url => url.endsWith('.xls') || url.endsWith('.csv'),
                            attributes: {
                                class: 'is_file csv',
                            }
                        }
                    }
                },

                heading: {
                    options: [{
                            model: 'paragraph',
                            title: '本文',
                            class: 'ck-heading_paragraph'
                        },
                        {
                            model: 'heading1',
                            view: 'h1',
                            title: 'Heading 1',
                            class: 'ck-heading_heading1'
                        },
                        {
                            model: 'headingFancy',
                            view: {
                                name: 'h2',
                                classes: 'article--ttl'
                            },
                            title: '見出し2',
                            class: 'ck-heading_heading2_fancy',

                            // It needs to be converted before the standard 'heading2'.
                            converterPriority: 'high'
                        }
                    ]
                },
            })
            .then(editor => {
                // Toolbarの定義
                const toolbarContainer = document.querySelector('#toolbar-container');
                toolbarContainer.appendChild(editor.ui.view.toolbar.element);

                // 更新・登録ボタン
                handleSaveButton(editor);
            })
            .catch(error => {
                console.error(error);
            });


        function handleSaveButton(editor) {
            $('.submitButton').on('click', evt => {
                $('#event-content').val(editor.getData());

                const img_list = Array.from(
                        new DOMParser()
                        .parseFromString(editor.getData(), 'text/html')
                        .querySelectorAll('img')
                    )
                    .map(img => `<input type="hidden" name="image[]" value="${img.getAttribute('src')}">`);


                const file_list = Array.from(
                        new DOMParser()
                        .parseFromString(editor.getData(), 'text/html')
                        .querySelectorAll('a')
                    )
                    .map(f => `<input type="hidden" name="_files[]" value="${f.getAttribute('href')}">`);

                $('#frm-form').append(img_list.join(''))
                $('#frm-form').append(file_list.join(''))

                setTimeout(() => {
                    $('#frm-form').submit();
                }, 500);

                return false;
            });
        }

    });
</script>
<?php $this->end('script') ?>