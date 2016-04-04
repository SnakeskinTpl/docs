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

module.exports = function (hljs) {
	return {
		case_insensitive: true,
		subLanguage: 'xml',
		contains: [
			hljs.COMMENT('///', '$'),
			hljs.C_BLOCK_COMMENT_MODE,
			hljs.BACKSLASH_ESCAPE,
			def.i18n,

			{
				className: 'directive',
				begin: /#?\{\s*/,
				end: /\s*}/,
				contains: [].concat(def.dir)
			},

			{
				className: 'directive',
				begin: /^\s*(?:#|-|\+=|<!|<|>|\(\)|\*|:)\s+/,
				end: '$',
				contains: [].concat(def.dir)
			}
		]
	};
};
