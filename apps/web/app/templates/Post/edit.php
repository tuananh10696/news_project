<?php $this->start('css') ?>
<style>
    .ck-editor__editable_inline {
        /* height: 500px; */
    }
</style>
<?php $this->end('css') ?>


<main id="main">
    <div class="post" style="height:500px">
        <form enctype="multipart/form-data" method="post" action="insert.php">
            <input id="editor">

            </form>
 

    </div>
</main>
<?php $this->start('script') ?>
<script src="/user/common/js/ckeditor/ckeditor.js"></script>
<?= $this->Html->script('/user/common/js/info/base'); ?>
<?= $this->Html->script('/user/common/js/info/edit'); ?>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ), {
        ckfinder: {
            uploadUrl: '/image.php',
            options: {
                resourceType: 'Images'
            }
        }
    } )
    .then( editor => {
        window.editor = editor;
    } )
    .catch( error => {
        console.error( 'There was a problem initializing the editor.', error );
    } );
</script>
<?php $this->end('script') ?>