- namespace docs.en.api['1::Directives']['14::Creating literals']['3::putIn']

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

Директива задает значение переменной or свойству объекта в виде подшаблона Snakeskin.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | `*`                | Block, logic | Not required |

## Description

Директива *putIn* несёт двойную функциональность: с одной стороны она позволяет присвоить подшаблон Snakeskin
переменной or свойству объекта, а с другой - является частью директивы [call](#call) и [target](#target).
Совместное использование *putIn* подробно рассмотрено в других главах, поэтому здесь описываться не будет.

Для изменения переменной or свойства объекта через *putIn* используется общая форма:

```js
putIn ссылка
	Шаблон
```

For example:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- var myObj = {}

	- putIn myObj.foo
		< .hello
			Hello world!

	- putIn myObj.calc
		() => a, b
			- return a + b

	- putIn myObj.arr
		- target []
			Hello people!

	? console.log(myObj)
```

```classic
{namespace demo}
{template index()}
	{var myObj = {} /}

	{putIn myObj.foo}
		{< .hello}
			Hello world!
		{/}
	{/}

	{putIn myObj.calc}
		{() => a, b}
			{return a + b}
		{/}
	{/}

	{putIn myObj.arr}
		{target []}
			Hello people!
		{/}
	{/}

	{? console.log(myObj)}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..
Директива может использоваться как внутри шаблонов or других директив, так и в глобальной области.

#{/block}
{/template}
