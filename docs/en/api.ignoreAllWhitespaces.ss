- namespace docs.en.api['1::Directives']['10::Working with whitespace']['2::ignoreAllWhitespaces']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

{template main[%fileName%]() extends base.main}
#{block root}

Директива декларирует, что все вложенные в директиву пробельные символы должны игнорироваться.

## Synopsis

| Declaration                                | Shorthand | Directive type       | Interpolation |
|-------------------------------------------|--------------------|---------------------|--------------|
| Only within templates or external blocks | `&+`               | Block, logic | Not required |

## Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	&+
		Hello             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	{&+}
		Hello             World Bar
	{/}
{/template}
```

#{/}

Отрендерится как:

```html
HelloWorldBar
```

#{/block}
{/template}
