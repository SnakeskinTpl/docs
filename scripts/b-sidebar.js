'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

$(() => {
	const
		doc = $(document),
		contents = $('nav.b-contents'),
		headerHeight = $('header.b-header').innerHeight(),
		arrows = $('.b-articles__nav-cont');

	doc.on('scroll', () => {
		if (doc.scrollTop() >= headerHeight) {
			contents.addClass('b-contents_full_true');
			arrows.addClass('b-articles__nav-cont_full_true');

		} else {
			contents.removeClass('b-contents_full_true');
			arrows.removeClass('b-articles__nav-cont_full_true');
		}
	});
});
