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
		el.id = `${$(el).closest('.b-article').attr('id')}--${el.textContent.trim().replace(/\s/g, '_')}`;
	});

	let rootTarget;

	const
		prev = $('.b-articles__prev'),
		next = $('.b-articles__next'),
		navHiddenClass = 'b-articles__nav-cont_hidden_true';

	prev.on('click', () => {
		if (!rootTarget) {
			return;
		}

		location.hash = rootTarget.prev('.b-article').attr('id');
	});

	next.on('click', () => {
		if (!rootTarget) {
			return;
		}

		location.hash = rootTarget.next('.b-article').attr('id');
	});

	$(document)
		.on('click', 'h2[id], h3[id], h4[id], h5[id], h6[id]', (e) => {
			location.hash = e.target.id;
		})

		.on('keypress', (e) => {
			if (!e.altKey || !{37: true, 39: true}[e.keyCode]) {
				return;
			}

			e.preventDefault();
			if (e.keyCode === 37 && !prev.hasClass(navHiddenClass)) {
				prev.trigger('click');

			} else if (e.keyCode === 39 && !next.hasClass(navHiddenClass)) {
				next.trigger('click');
			}
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
			rootTarget = target;

			const
				id = target.attr('id');

			if (id === $('.b-article:eq(0)').attr('id')) {
				prev.addClass(navHiddenClass);

			} else {
				prev.removeClass(navHiddenClass);
			}

			if (id === $('.b-article:eq(-1)').attr('id')) {
				next.addClass(navHiddenClass);

			} else {
				next.removeClass(navHiddenClass);
			}
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
