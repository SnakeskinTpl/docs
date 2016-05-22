- namespace docs.en.api['1::Directives']['6::Logic directives']['1::if']

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

Директива *if* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива позволяет вашему шаблону в зависимости от условий выполнить некоторую логику
или сгенерировать фрагмент шаблона, основываясь на значении переменной or выражения.

Директива начинается с ключевого слова `if`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно).

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- if true
	Hello world!
```

```classic
{if true}
	Hello world!
{/if}
```

#{/}

The directive can be used anywhere. Вместе с основной
директивой можно использовать дополнительные:

1. `else` - аналог `else` в JS;
2. `else if` - аналог `else if` в JS;
3. `else unless` - аналог `else if (!(...))` в JS.

### Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- if val > 3
			< .success
				Значение больше чем 3.

		- else if val < 3
			< .fail
				Значение меньше чем 3.

		- else
			< .error
				Значение рано 3.
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{if val > 3}
			{< .success}
				Значение больше чем 3.
			{/}

		{else if val < 3}
			{< .fail}
				Значение меньше чем 3.
			{/}

		{else}
			{< .error}
				Значение рано 3.
			{/}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
