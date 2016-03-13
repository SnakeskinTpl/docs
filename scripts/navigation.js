'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

$(() => {
	$('.b-article').find('h2, h3, h4, h5, h6').each((i, el) => {
		el.id = el.textContent.trim().replace(/\s/g, '_');
	});

	$(document).on('click', 'h2[id], h3[id], h4[id], h5[id], h6[id]', (e) => {
		location.hash = e.target.id;
	});

	function emptyHash() {
		let
			hash = decodeURIComponent(location.hash),
			target = hash && $(hash);

		function setArticle(target) {
			if (!target.length) {
				target = $('.b-article:eq(0)');
				hash = target.attr('id');
			}

			$('.b-article').removeClass('b-article_active_true');
			target.addClass('b-article_active_true');
		}

		if (!hash || target.hasClass('b-article')) {
			setArticle(target);

		} else {
			setArticle(target.closest('.b-article'));
			target.length && $(window).scrollTop(target.offset().top);
		}

		if (hash !== location.hash) {
			location.hash = hash;
		}
	}

	$(window).on('hashchange', (emptyHash(), emptyHash));
});
