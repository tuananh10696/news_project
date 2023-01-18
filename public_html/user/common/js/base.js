function setWysiwyg(elm, slug) {

	if (slug == 'case') {
		ClassicEditor
			.create(document.querySelector(elm), {
				'alignment': {
					options: [
						{ name: 'left', className: 'text-left' },
						{ name: 'right', className: 'text-right' },
						{ name: 'center', className: 'text-center' }
					]
				},

				// removePlugins: ['CKFinderUploadAdapter', 'CKFinder', 'EasyImage', 'Image', 'ImageCaption', 'ImageStyle', 'ImageToolbar', 'ImageUpload', 'MediaEmbed'],
				toolbar: {
					items: [
						'fontColor', 'fontBackgroundColor',
						'|',
						'bold', 'italic', 'underline', 'strikethrough',
						'|',
						'bulletedList', 'alignment',
						'|',
						'link'
					],
				},

				mediaEmbed: {
					previewsInData: true,
				},
				language: "jp",

				list: {
					properties: { styles: false, startIndex: false, reversed: false }
				},

				// a タグの設定
				link: {
					// attr target＝＿blank
					addTargetToExternalLinks: true,
				},

			}).catch((error) => {
				console.error(error);
			});

	} else {
		ClassicEditor
			.create(document.querySelector(elm), {
				'alignment': {
					options: [
						{ name: 'left', className: 'text-left' },
						{ name: 'right', className: 'text-right' },
						{ name: 'center', className: 'text-center' }
					]
				},

				// removePlugins: ['CKFinderUploadAdapter', 'CKFinder', 'EasyImage', 'Image', 'ImageCaption', 'ImageStyle', 'ImageToolbar', 'ImageUpload', 'MediaEmbed'],
				toolbar: {
					items: [
						'fontColor', 'fontBackgroundColor',
						'|',
						'bold', 'italic', 'underline', 'strikethrough',
						'|',
						'bulletedList', 'alignment',
						'|',
						'link', 'insertTable', 'sourceEditing'
					],
				},
				table: {
					contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells']
				},

				mediaEmbed: {
					previewsInData: true,
				},
				language: "jp",

				list: {
					properties: { styles: false, startIndex: false, reversed: false }
				},

				// a タグの設定
				link: {
					// attr target＝＿blank
					addTargetToExternalLinks: true,

				},

			}).catch((error) => {
				console.error(error);
			});

	}

	return;
}


function chooseFileUpload(e) {
	var $this = $(e);
	$this.parents('.td_parent').find('.error-message').remove();

	var files = $this[0].files;
	var types = $this.attr('data-type');
	var types = types.split(",");

	var is_file_type = false;


	for (let i = 0; i < files.length; i++) {
		const __type = files[i].type;
		if ($.inArray(__type, types) === -1) {
			is_file_type = true;
			break;
		}
	}
	if (is_file_type) {
		$this.parents('.td_parent').append(`<div class="error-message"><div class="error-message">指定されたファイルを選択してください</div></div>`);
		$this.val('');
		return false;
	}
}

function matchYoutubeUrl(url) {
	var p = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
	var matches = url.match(p);
	return matches ? matches[1] : false;
}


