- namespace base

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- prfx = @@lang !== 'en' ? '-' + @@lang : ''
- import Typograf from 'typograf'
- import MarkdownIt from 'markdown-it'
- import hljs from 'highlight.js'

- template typograf(params)
	- return
		() => target
			- return
				() =>
					- return new Typograf(params).execute(target.apply(this, arguments))

- template md(target)
	- return
		() =>
			- block highlight(str, lang)
				&+
					< pre.hljs.example-${lang || 'default'}
						< code
							+= hljs.highlight(lang && hljs.getLanguage(lang) ? lang : 'js', str).value

				- return getTplResult()
			- return MarkdownIt({html: true, highlight: self.highlight}).render(target.apply(this, arguments))

#{block main->example(content)}
#{< .b-example}

#{< menu.&__toggle}

#{< li.&__link[.&_active_true]}jade-like#{/}
#{< li.&__link}classic#{/}

#{/}

#{< .&__code}

#{+= content /}

#{/}
#{/}
#{/block}

- @md
- placeholder main() @= tolerateWhitespaces true @= localization false
