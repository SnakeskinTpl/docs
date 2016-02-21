- namespace base

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- import Typograf from 'typograf'
- import MarkdownIt from 'markdown-it'

- template typograf(params) @= renderAs 'template'
	- return
		() => target
			- return
				() =>
					- return new Typograf(params).execute(target.apply(this, arguments))

- template md(target) @= renderAs 'template'
	- return
		() =>
			- return MarkdownIt().render(target.apply(this, arguments))

- @md
- @typograf({lang: @@lang || 'ru'})
- placeholder main() @= tolerateWhitespaces true @= localization false
