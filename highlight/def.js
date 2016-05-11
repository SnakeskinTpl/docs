'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

const
	hljs = require('highlight.js');

Object.defineProperties(exports, {
	dirs: {
		get() {
			return {
				built_in: [
					'namespace head eval',
					'include import set',
					'end',
					'template interface placeholder decorator async',
					'block callback return',
					'super void with yield await',
					'var target putIn global const',
					'output call literal',
					'if unless else',
					'switch case default',
					'try catch finally throw',
					'for while do break continue',
					'forEach forIn',
					'doctype attr tag script style link comment',
					'op sp ignoreWhitespaces ignoreAllWhitespaces unIgnoreAllWhitespaces',
					'series parallel waterfall final when'
				].join(' ')
			};
		}
	},

	i18n: {
		get() {
			return {
				className: 'string',
				begin: '`',
				end: '`'
			};
		}
	},

	dirContent: {
		get() {
			return {
				relevance: 0,
				endsWithParent: true,
				contains: [
					hljs.COMMENT('///', '$'),
					hljs.C_BLOCK_COMMENT_MODE,
					hljs.APOS_STRING_MODE,
					hljs.QUOTE_STRING_MODE,
					hljs.BACKSLASH_ESCAPE,
					exports.i18n,

					{
						className: 'keyword',
						begin: /\|[\w$!]+|=>|->|@=|\s+extends\s+/,
						relevance: 0
					},

					{
						className: 'number',
						variants: [
							{begin: /\b(0[bB][01]+)/},
							{begin: /\b(0[oO][0-7]+)/},
							{begin: hljs.C_NUMBER_RE}
						],

						relevance: 0
					}
				]
			};
		}
	},

	dir: {
		get() {
			return [
				{
					className: 'name',
					begin: /\belse(?: if| unless|) /,
					keywords: {built_in: 'else if unless'},
					starts: exports.dirContent
				},

				{
					className: 'name',
					begin: /\basync (?:template|interface|placeholder)\b/,
					keywords: {built_in: 'async template interface placeholder'},
					starts: exports.dirContent
				},

				{
					className: 'name',
					begin: new RegExp(`/?\\b(?:${exports.dirs.built_in.split(' ').join('|')})\\b`),
					keywords: exports.dirs,
					starts: exports.dirContent
				},

				exports.dirContent
			];
		}
	},

	classic: {
		get() {
			return [
				hljs.COMMENT('///', '$'),
				hljs.C_BLOCK_COMMENT_MODE,
				hljs.BACKSLASH_ESCAPE,
				exports.i18n,

				{
					className: 'directive',
					begin: /#?\{\s*/,
					end: /\s*}/,
					contains: exports.dir
				}
			];
		}
	}
});
