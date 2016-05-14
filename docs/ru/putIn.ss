- namespace docs.ru.api['1::Директивы']['14::Создание литералов']['3::putIn']

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

Директива задает значение переменной или свойству объекта в виде подшаблона Snakeskin.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы       | Интерполяция |
|-----------------|--------------------|---------------------|--------------|
| Без ограничений | `*`                | Блочная, логическая | Не требуется |

## Описание

Директива *putIn* несёт двойную функциональность: с одной стороны она позволяет присвоить подшаблон Snakeskin
переменной или свойству объекта, а с другой - является частью директивы [call](#call) и [target](#target).
Совместное использование *putIn* подробно рассмотрено в других главах, поэтому здесь описываться не будет.

Для изменения переменной или свойства объекта через *putIn* используется общая форма:

```js
putIn ссылка
	Шаблон
```

Например:

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
Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

#{/block}
{/template}
