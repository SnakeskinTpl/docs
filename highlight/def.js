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

const dirs = exports.dirs = {
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
		'for while do',
		'forEach forIn',
		'doctype attr tag script style link comment',
		'op sp ignoreWhitespaces ignoreAllWhitespaces unIgnoreAllWhitespaces'
	].join(' ')
};

const i18n = exports.i18n = {
	className: 'string',
	begin: '`',
	end: '`'
};

const dirContent = exports.dirContent = {
	relevance: 0,
	endsWithParent: true,
	contains: [
		hljs.APOS_STRING_MODE,
		hljs.QUOTE_STRING_MODE,
		hljs.BACKSLASH_ESCAPE,
		i18n,

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

exports.dir = [
	{
		className: 'name',
		begin: /else(?: if| unless|) /,
		keywords: {built_in: 'else if unless'},
		starts: dirContent
	},

	{
		className: 'name',
		begin: /[^\s}]+/,
		keywords: dirs,
		starts: dirContent
	}
];
