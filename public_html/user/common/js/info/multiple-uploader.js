function triggerInput ( element, event )
{
    if ( event.target.className === 'multiple-uploader' || event.target.className === 'mup-msg' || event.target.className === 'mup-main-msg' )
        $( element ).find( '._image_' ).click();
}

function previewImage ( element )
{
    const files = $( element )[ 0 ].files;
    const mui = $( '#multiple-uploader' );
    const current_items = mui.find( '.image-container' );
    const image_container = $( `
        <div class="image-container">
            <label onclick="deleteImgLabel(this)" for="deleteImg_0">x</label>
            <input type="hidden" value="41" class="block_type"/>
            <input type="hidden" value="0" class="section_sequence_id"/>
            <img src="" class="image-preview" />
        </div>
    `);

    if ( files.length == 0 ) return false;

    if ( current_items.length + files.length > 10 )
    {
        alert_dlg( '10ファイルまでアップロード出来ます' );
        return false
    }

    mui.find( '.mup-msg' ).addClass( 'd-none' );

    for ( let index = 0; index < files.length; index++ )
    {
        const file = files[ index ];
        const item = image_container.clone();

        item.attr( 'data-pos', index + current_items.length );
        item.find( 'img' ).attr( 'src', URL.createObjectURL( file ) );
        item.find( '.block_type' ).attr( 'name', `info_contents[${ index + current_items.length }][block_type]` );
        item.find( '.section_sequence_id' ).attr( 'name', `info_contents[${ index + current_items.length }][section_sequence_id]` );

        mui.append( item );
    }

    setDataInput();
}


function deleteImgLabel ( e )
{
    const par = $( e ).parents( '.image-container' );
    const old_img = $( 'input[name="delete_ids[]"]' );
    const dt = new DataTransfer();
    const __image__ = document.querySelector( '.__image__' );
    const inputId = $( e ).attr( 'for' );

    $( `#${ inputId }` ).attr( 'checked', 'checked' );

    for ( const [ index, file ] of Object.entries( __image__.files ) )
        if ( parseInt( par.attr( 'data-pos' ) ) - old_img.length != index )
            dt.items.add( file )

    __image__.files = dt.files;

    par.remove();
    $( '#multiple-uploader .image-container' ).each( function ( i )
    {
        $( this ).attr( 'data-pos', i );
        $( this ).find( '.block_type' ).attr( 'name', `info_contents[${ i }][block_type]` );
        $( this ).find( '.section_sequence_id' ).attr( 'name', `info_contents[${ i }][section_sequence_id]` );
        $( this ).find( '.old_img' ).attr( 'name', `info_contents[${ i }][_old_image]` );
        $( this ).find( '.old_img_id' ).attr( 'name', `info_contents[${ i }][id]` );
    } );

    if ( $( '#multiple-uploader' ).find( '.image-container' ).length == 0 ) $( '#multiple-uploader' ).find( '.mup-msg' ).removeClass( 'd-none' );
}


function setDataInput ()
{
    const dt = new DataTransfer();
    const _image_ = document.querySelector( '._image_' );
    const __image__ = document.querySelector( '.__image__' );

    for ( const [ index, file ] of Object.entries( __image__.files ) )
        dt.items.add( file );

    for ( const [ index, file ] of Object.entries( _image_.files ) )
        dt.items.add( file );

    __image__.files = dt.files;
    _image_.value = [];
}