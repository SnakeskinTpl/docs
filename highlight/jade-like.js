'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

const
	def = require('./def');

module.exports = function () {
	return {
		case_insensitive: true,
		subLanguage: 'xml',
		contains: def.classic.concat([
			{
				className: 'directive',
				begin: /^\s*(?:#|-|\+=|<!|<|>|\(\)|\*|:|@=)\s+/,
				end: '$',
				contains: def.dir
			}
		])
	};
};
