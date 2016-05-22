- namespace docs.en.api['1::Directives']['3::Global context']['2::head']

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

Директива создаёт блок, который не выполнится на этапе трансляции, но войдёт в конечный JS.

## Synopsis

| Declaration                  | Shorthand | Directive type       | Interpolation |
|-----------------------------|--------------------|---------------------|--------------|
| Only in the global scope | Absent        | Block, logic | Not required |

## Description

Т.к. любой код, размещённый вне тела шаблона будет выполняться как на этапе трансляции, так и войдёт в конечный JS код,
то директива *head* позволяет создать блок, содержимое которого по прежнему не будет исключаться из результирующего кода,
но не будет выполняться на этапе трансляции, а также переменные, которые были объявлены на корневом уровне директивы,
будут считаться глобальными.

#{+= self.example()}

```jade-like
- namespace demo

- head
	\/// Данный forEach не выполнится на этапе трансляции,
	\/// но войдёт в конечный JS
	- forEach [1, 2, 3] => el
		? console.log(el)

	\/// Данная переменная глобальная,
	\/// хоть и объявлена внутри блочной директивы
	: foo = 'bar'

- template index()
	? console.log(foo) \/// 'bar'
```

```classic
{namespace demo}

{head}
	\/// Данный forEach не выполнится на этапе трансляции,
	\/// но войдёт в конечный JS
	{forEach [1, 2, 3] => el}
		{? console.log(el)}
	{/}

	\/// Данная переменная глобальная,
	\/// хоть и объявлена внутри блочной директивы
	{var a = 1 /}
{/}

{template index()}
	{? console.log(foo)} \/// 'bar'
{/template}
```

#{/}

Директива может использоваться только в глобальной области.

#{/block}
{/template}
