
$ ->
	$(document).on('click', '.ideas .idea', ( ->
		$(this).find('.body-short').toggle();
		$(this).find('.body-full').toggle();
		true
	));
	true
