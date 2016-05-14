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
		el.id = `${$(el).closest('.b-article').attr('id')}--${el.textContent.trim().replace(/[\s.,$]/g, '_')}`;
	});

	let rootTarget;

	const
		prev = $('.b-articles__prev'),
		next = $('.b-articles__next');

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
			if (e.keyCode === 37 && !prev.hasClass('b-articles__nav-cont_hidden_true')) {
				prev.trigger('click');

			} else if (e.keyCode === 39 && !next.hasClass('b-articles__nav-cont_hidden_true')) {
				next.trigger('click');
			}
		});

	const
		contents = $('.b-contents');

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
				id = target.attr('id'),
				link = contents.find(`.b-contents__link[href='#${id}']`);

			contents
				.find('.b-contents__link')
				.removeClass('b-contents__link_active_true')
				.closest('li')
				.find('.b-contents__sub')
				.remove();

			link
				.addClass('b-contents__link_active_true');

			let
				sub = $('<ul class="b-contents__sub">'),
				pos = 2;

			target.find('h2, h3').each((i, el) => {
				const
					rank = Number(/\d+/.exec(el.tagName.toLowerCase())[0]);

				if (rank > pos) {
					const tmp = $('<li class="b-contents__part b-contents__part_link_false"><ul></li>');
					sub.append(tmp);
					sub = tmp.find('ul');

				} else if (rank < pos) {
					sub = sub.parent().closest('ul');
				}

				if (pos !== rank) {
					pos = rank;
				}

				sub.append(
					$(`
						<li class="b-contents__part b-contents__part_link_true">
							<a href="#${el.id}" class="b-contents__link b-contents__link_active_${hash.slice(1) === el.id}">${el.textContent}</a>
						</li>
					`)
				);
			});

			link
				.closest('li')
				.append(sub.is('.b-contents__sub') ? sub : sub.closest('.b-contents__sub'));

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

		const
			win = $(window),
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
