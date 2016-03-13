'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

$(() => {
	$(document).on('click', '.b-example__link:not(.b-example__link_active_true)', (e) => {
		const
			el = $(e.target),
			block = el.closest('.b-example'),
			val = el.text();

		el
			.addClass('b-example__link_active_true')
			.siblings().removeClass('b-example__link_active_true');

		block.find(`.b-example__code > pre:not(.example-${val})`).hide();
		block.find(`.example-${val}`).show();
	});
});
