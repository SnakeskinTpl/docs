'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

$(() => {
	function emptyHash() {
		let
			hash = location.hash,
			target = hash && $(hash);

		function setArticle(target) {
			if (!target.length) {
				target = $('.b-article:eq(0)');
				hash = target.attr('id');
			}

			$('.b-article').removeClass('b-article_active_true');
			target.addClass('b-article_active_true');
		}

		if (target.hasClass('b-article')) {
			setArticle(target);

		} else {
			setArticle(target.closest('.b-article'));
			$(window).scrollTop(target.offset().top);
		}

		if (hash !== location.hash) {
			location.hash = hash;
		}
	}

	$(window).on('hashchange', (emptyHash(), emptyHash));
});
