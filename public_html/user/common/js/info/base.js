function setWysiwyg ( elm )
{

	ClassicEditor
		.create( document.querySelector( elm ), {
			'alignment': {
				options: [
					{ name: 'left', className: 'text-left' },
					{ name: 'right', className: 'text-right' },
					{ name: 'center', className: 'text-center' }
				]
			}
		} )
		.then( editor =>
		{
			// editor.ui.view.editable.element.style.height = '300px';
		} )
		.catch( error =>
		{
			// console.log(elm);
			console.error( error );
		} );


	return;
}


function chooseFileUpload ( e )
{
	var $this = $( e );
	$this.parents( '.td_parent' ).find( '.error-message' ).remove();

	var files = $this[ 0 ].files;
	var types = $this.attr( 'data-type' );
	var types = types.split( "," );

	var is_file_type = false;


	for ( let i = 0; i < files.length; i++ )
	{
		const __type = files[ i ].type;
		if ( $.inArray( __type, types ) === -1 )
		{
			is_file_type = true;
			break;
		}
	}
	if ( is_file_type )
	{
		$this.parents( '.td_parent' ).append( `<div class="error-message"><div class="error-message">指定されたファイルを選択してください</div></div>` );
		$this.val( '' );
		return false;
	}
}


function preview_img_action ( e, is_back_old_image )
{
	$( e )
		.parents( '.preview_img' )
		.addClass( 'dpl_none' )
		.siblings( 'input' )
		.val( '' )
		.siblings( '.thumbImg' )
		.removeClass( 'dpl_none' );

	if ( is_back_old_image )
		$( e )
			.parents( '.preview_img' )
			.siblings( '.thumbImg' )
			.removeClass( 'dpl_none' );
}

function matchYoutubeUrl ( url )
{
	var p = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
	var matches = url.match( p );
	return matches ? matches[ 1 ] : false;
}

function getVideoYT ( e )
{
	var inp_val = $( e ).val();
	if ( inp_val != '' )
	{
		$( '.yt' ).removeClass( 'dpl_none' );

		if ( inp_val.match( /^\/movie\// ) )
		{
			var video = `<video width="320" height="240" controls>
				<source src="${ inp_val }" type="video/mp4">
			</video>`;
		} else
		{
			var id = matchYoutubeUrl( inp_val ) ? matchYoutubeUrl( inp_val ) : inp_val;
			var video = `<iframe width="560" height="315" src="https://www.youtube.com/embed/${ id }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
		}

		$( '.yt' ).html( video );
	} else $( '.yt' ).addClass( 'dpl_none' ).html( '' );
}