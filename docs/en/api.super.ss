- namespace docs.en.api['1::Directives']['16::Inheritance']['1::super']

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

Директива вставляет в шаблон тело родительского [блока](#block).

## Synopsis

| Declaration                                | Shorthand | Directive type         | Interpolation |
|-------------------------------------------|--------------------|-----------------------|--------------|
| Only within templates or external blocks | Absent        | Inline, logic | Not required |

## Description

Директива работает по схеме: всплывает по дереву шаблона до тех пор, пока не найдётся блок,
который имеет родителя, и вставляет родительское тело в указанное место, а если такого родителя нет,
то просто ничего не делает. Директива может использоваться только внутри шаблонов or внешних блоков.

### Examples

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- block base
		Какой хороший день!

- template child() extends @base
	- block base
		- super
		Трудиться мне не лень!
```

```classic
{namespace demo}

{template base()}
	{block base}
		Какой хороший день!
	{/}
{/template}

{template child() extends @base}
	{block base}
		{super}
		Трудиться мне не лень!
	{/}
{/template}
```

#{/}

#{/block}
{/template}
