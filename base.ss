- namespace base

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- import MarkdownIt from 'markdown-it'

- template md(target) @= renderAs 'template'
	- return
		() =>
			- return MarkdownIt().render(target.apply(this, arguments))

- @md
- placeholder main() @= tolerateWhitespaces true @= localization false
