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
			el.id = $(el).closest('.b-article').attr('id') + '--' + el.textContent.trim().replace(/\s|\.|\$/g, '_');
		});

		var rootTarget = void 0;

		var prev = $('.b-articles__prev'),
		    next = $('.b-articles__next');

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
			if (e.keyCode === 37 && !prev.hasClass('b-articles__nav-cont_hidden_true')) {
				prev.trigger('click');
			} else if (e.keyCode === 39 && !next.hasClass('b-articles__nav-cont_hidden_true')) {
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

				var id = target.attr('id'),
				    link = contents.find('.b-contents__link[href=\'#' + id + '\']');

				contents.find('.b-contents__link').removeClass('b-contents__link_active_true').closest('li').find('.b-contents__sub').remove();

				link.addClass('b-contents__link_active_true');

				var sub = $('<ul class="b-contents__sub">'),
				    pos = 2;

				target.find('h2,h3').each(function (i, el) {
					var rank = Number(/\d+/.exec(el.tagName.toLowerCase())[0]);

					if (rank > pos) {
						var tmp = $('<li class="b-contents__part b-contents__part_link_false"><ul></li>');
						sub.append(tmp);
						sub = tmp.find('ul');
					} else {
						sub = sub.closest('ul');
					}

					if (pos !== rank) {
						pos = rank;
					}

					console.log(hash, el.id);

					sub.append($('\n\t\t\t\t\t\t<li class="b-contents__part b-contents__part_link_true">\n\t\t\t\t\t\t\t<a href="#' + el.id + '" class="b-contents__link b-contents__link_active_' + (hash.slice(1) === el.id) + '">' + el.textContent + '</a>\n\t\t\t\t\t\t</li>\n\t\t\t\t\t'));
				});

				link.closest('li').append(sub.is('.b-contents__sub') ? sub : sub.closest('.b-contents__sub'));

				if (id === $('.b-article:eq(0)').attr('id')) {
					prev.addClass('b-articles__nav-cont_hidden_true');
				} else {
					prev.removeClass('b-articles__nav-cont_hidden_true');
				}

				if (id === $('.b-article:eq(-1)').attr('id')) {
					next.addClass('b-articles__nav-cont_hidden_true');
				} else {
					next.removeClass('b-articles__nav-cont_hidden_true');
				}
			}

			var win = $(window),
			    duration = 250;

			if (!hash || target.hasClass('b-article')) {
				setArticle(target);
				win.scrollTo(0, duration);
			} else {
				setArticle(target.closest('.b-article'));
				target.length && win.scrollTo(target.offset().top, duration);
			}

			if (hash !== location.hash) {
				location.hash = hash;
			}
		}

		$(window).on('hashchange', (emptyHash(), emptyHash));
	});

}());