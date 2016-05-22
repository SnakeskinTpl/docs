- namespace docs.en.api['1::Directives']['9::Working with exceptions']['2::throw']

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

Директива *throw* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration      | Shorthand | Directive type         | Interpolation |
|-----------------|--------------------|-----------------------|--------------|
| No limits | Absent        | Inline, logic | Not required |

## Description

Директива генерирует заданное исключение и начинается с ключевого слова `throw`, которое должно сопровождаться выражением.
Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- throw new Error('Ошибка')
```

```classic
{throw new Error('Ошибка')}
```

#{/}

The directive can be used anywhere.

### Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- if value > 1
			- throw new Error('Invalid value')
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{if value > 1}
			{throw new Error('Invalid value')}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
