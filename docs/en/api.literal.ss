- namespace docs.en.api['1::Directives']['12::Char escaping']['2::literal']

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

Директива задаёт блок текста, который вставляется без изменений в результирующую функцию, а также
будет врапиться специальными текстовыми символами согласно параметру [literalBounds](#compile--literalBounds).

## Synopsis

| Declaration                                | Shorthand | Directive type        | Interpolation   |
|-------------------------------------------|--------------------|----------------------|----------------|
| Only within templates or external blocks | Not required       | Inline, text | Supported |

## Description

Директива используется для [интеграции шаблонов Snakeskin с другими шаблонами](#{@@guide}#introLiteral).
Директива может использоваться только внутри шаблонов or внешних блоков.

### Examples
#### Простое использование

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{{ Hello }}
```

```classic
{namespace demo}
{template index()
	{{ Hello }}
{/template}
```

#{/}

Отрендерится как:

```html
{{ Hello }}
```

#### Интерполяция

Для передачи значений Snakeskin внутрь директивы используется [стандартный механизм интерполяции](#{@@guide}#basics--Интерполяция).

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{{ Hello${1 + 2} }}
```

```classic
{namespace demo}
{template index()
	{{ Hello${1 + 2} }}
{/template}
```

#{/}

Отрендерится как:

```html
{{ Hello3 }}
```

#### Задание literalBounds

#{+= self.example()}

```jade-like
- namespace demo
- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{namespace demo}
{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

Отрендерится как:

```html
<?php Hello ?>
```

#{/block}
{/template}
