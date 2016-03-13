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
		baseTop = parseFloat(contents.css('top')),
		headerHeight = $('header.b-header').innerHeight();

	doc.on('scroll', () => {
		if (doc.scrollTop() >= headerHeight) {
			contents.addClass('b-contents_full_true');

		} else {
			//console.log(baseTop);
			//contents.css('top', baseTop - doc.scrollTop() + headerHeight);
			contents.removeClass('b-contents_full_true');
		}
	});
});
