(function () {
	'use strict';

	/*!
	 * snakeskin.github.io
	 * https://github.com/SnakeskinTpl/snakeskin.github.io
	 *
	 * Released under the MIT license
	 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
	 */

	$(function () {
		$(document).on('click', '.b-example__link:not(.b-example__link_active_true)', function (e) {
			var el = $(e.target),
			    block = el.closest('.b-example'),
			    val = el.text();

			el.addClass('b-example__link_active_true').siblings().removeClass('b-example__link_active_true');

			block.find('.b-example__code > pre:not(.example-' + val + ')').hide();
			block.find('.example-' + val).show();
		});
	});

	/*!
	 * snakeskin.github.io
	 * https://github.com/SnakeskinTpl/snakeskin.github.io
	 *
	 * Released under the MIT license
	 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
	 */

	$(function () {
		var doc = $(document),
		    contents = $('nav.b-contents'),
		    headerHeight = $('header.b-header').innerHeight(),
		    arrows = $('.b-articles__nav-cont');

		doc.on('scroll', function () {
			if (doc.scrollTop() >= headerHeight) {
				contents.addClass('b-contents_full_true');
				arrows.addClass('b-articles__nav-cont_full_true');
			} else {
				contents.removeClass('b-contents_full_true');
				arrows.removeClass('b-articles__nav-cont_full_true');
			}
		});
	});

	/*!
	 * snakeskin.github.io
	 * https://github.com/SnakeskinTpl/snakeskin.github.io
	 *
	 * Released under the MIT license
	 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
	 */

	$(function () {
		$('.b-article').find('h2, h3, h4, h5, h6').each(function (i, el) {
			el.id = $(el).closest('.b-article').attr('id') + '--' + el.textContent.trim().replace(/\s/g, '_');
		});

		var rootTarget = void 0;

		var prev = $('.b-articles__prev'),
		    next = $('.b-articles__next'),
		    navHiddenClass = 'b-articles__nav-cont_hidden_true';

		prev.on('click', function () {
			if (!rootTarget) {
				return;
			}

			location.hash = rootTarget.prev('.b-article').attr('id');
		});

		next.on('click', function () {
			if (!rootTarget) {
				return;
			}

			location.hash = rootTarget.next('.b-article').attr('id');
		});

		$(document).on('click', 'h2[id], h3[id], h4[id], h5[id], h6[id]', function (e) {
			location.hash = e.target.id;
		}).on('keypress', function (e) {
			if (!e.altKey || !{ 37: true, 39: true }[e.keyCode]) {
				return;
			}

			e.preventDefault();
			if (e.keyCode === 37 && !prev.hasClass(navHiddenClass)) {
				prev.trigger('click');
			} else if (e.keyCode === 39 && !next.hasClass(navHiddenClass)) {
				next.trigger('click');
			}
		});

		var contents = $('.b-contents');

		function emptyHash() {
			var hash = decodeURIComponent(location.hash),
			    target = hash && $(hash);

			function setArticle(target) {
				if (!target.length) {
					target = $('.b-article:eq(0)');
					hash = target.attr('id');
				}

				$('.b-article').removeClass('b-article_active_true');
				target.addClass('b-article_active_true');
				rootTarget = target;

				var id = target.attr('id');

				contents.find('.b-contents__link').removeClass('b-contents__link_active_true');
				contents.find('.b-contents__link[href=\'#' + id + '\']').addClass('b-contents__link_active_true');

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

}());