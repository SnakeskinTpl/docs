- namespace docs.en.api['1::Directives']['10::Working with whitespace']['4::sp']

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

Директива вставляет в шаблон пробельный символ (актуально только для Jade-Like).

## Synopsis

| Declaration                                | Shorthand | Directive type        | Interpolation |
|-------------------------------------------|--------------------|----------------------|--------------|
| Only within templates or external blocks | `\\`               | Inline, text | Not required |

## Examples

```jade-like
- namespace demo
- template index(value, area)
	< .foo
	\
	< .bar
```

Отрендерится как:

```html
<div class="foo"></div> <div class="bar"></div>
```

#{/block}
{/template}
