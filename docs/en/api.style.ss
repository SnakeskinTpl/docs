- namespace docs.en.api['1::Directives']['11::Working with HTML/XML']['5::style']

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

Директива вставляет в шаблон код декларации тега `<style>` с заданными параметрами.

## Synopsis

| Declaration                                | Shorthand | Directive type      | Interpolation   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Only within templates or external blocks | Absent        | Block, text | Supported |

## Description

Директива предназначена для более удобного задания тегов `<style>` и может использоваться только внутри шаблонов или
внешних блоков.

### Таблица обозначений
#### css

```
text/css
```

### Examples
#### Использование значения по умолчанию (css)

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#### Явное указание типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style css
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style css}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#### Указание собственного типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style text/stylus
		.foo
			color red
```

```classic
{namespace demo}
{template index()}
	\#{style text/stylus}
		.foo
			color red
	\#{/}
{/template}
```

#{/}

#### Задание произвольных атрибутов

*(используется синтаксис [attr](#attr))*

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style css class = foo
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style css class = foo}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#{/block}
{/template}
