- namespace docs.en.api['1::Directives']['14::Creating literals']['2::target']

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

Директива возвращает ссылку на заданный объект и позволяет задавать ему свойства со значениями
в виде подшаблонов Snakeskin.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива *target* несёт двойную функциональность: с одной стороны она возвращает ссылку на указанный объект, а с
другой может задавать ему свойства-подшаблоны Snakeskin - т.е. представляет из себя литеральную форму для создания массивов
и объектов со значениями в виде шаблонов, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- target {}
		* prop1
			< .hello
				Hello world!

		* prop 2
			- if val > 1
				Success!
```

```classic
{namespace demo}
{template index()}
	{target {}}
		{* prop1}
			{< .hello}
				Hello world!
			{/}
		{/}

		{* prop 2}
			{if val > 1}
				Success!
			{/}
		{/}
	{/}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..
Свойства объекту ставятся с помощью директивы [putIn](#putIn). Чтобы получить явную ссылку на созданный объект,
то его нужно присвоить переменной: самый простой способ - это использовать оператор `as`, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- target {} as myObj
		* prop1
			< .hello
				Hello world!

		* prop 2
			- if val > 1
				Success!

	? console.log(myObj)
```

```classic
{namespace demo}
{template index()}
	{target {} as myObj}
		{* prop1}
			{< .hello}
				Hello world!
			{/}
		{/}

		{* prop 2}
			{if val > 1}
				Success!
			{/}
		{/}
	{/}

	{? console.log(myObj)}
{/template}
```

#{/}

А также можно использовать директиву [var](#var) в режиме `putIn`:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- var putIn myObj
		- target {}
			* prop1
				< .hello
					Hello world!

			* prop 2
				- if val > 1
					Success!

	? console.log(myObj)
```

```classic
{namespace demo}
{template index()}
	{var putIn myObj}
		{target {}}
			{* prop1}
				{< .hello}
					Hello world!
				{/}
			{/}

			{* prop 2}
				{if val > 1}
					Success!
				{/}
			{/}
		{/}
	{/}

	{? console.log(myObj)}
{/template}
```

#{/}

Общая форма директивы следующая:

```js
target ссылка на объект or сам объект [as опциональный идентификатор]
	[* опциональные свойства]
```

При использовании *target* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{target {a: 1, b: 2}}{/}

\/// Короткая форма закрытия
{target {a: 1, b: 2} /}
```

Можно использовать директиву для уже созданных объектов, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- var myObj = {}
	- target myObj
		* prop1
			< .hello
				Hello world!

		* prop 2
			- if val > 1
				Success!

	? console.log(myObj)
```

```classic
{namespace demo}
{template index()}
	{var myObj = {} /}
	{target myObj}
		{* prop1}
			{< .hello}
				Hello world!
			{/}
		{/}

		{* prop 2}
			{if val > 1}
				Success!
			{/}
		{/}
	{/}

	{? console.log(myObj)}
{/template}
```

#{/}

Директива может использоваться как внутри шаблонов or других директив, так и в глобальной области.

### Значение ключа putIn для объекта

Значение переданное в директиву *putIn* при задании свойства объекта трактуется как простая строка,
а для прокидывания значений Snakeskin внутрь директивы используется
[стандартный механизм интерполяции](#{@@guide}#basics--Интерполяция), например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- target {} as myObj
		* some prop name ${1 + 2}
			< .hello
				Hello world!

	? console.log(myObj['some prop name 3'])
```

```classic
{namespace demo}
{template index()}
	{target {} as myObj}
		{* some prop name ${1 + 2}}
			{< .hello}
				Hello world!
			{/}
		{/}
	{/}

	{? console.log(myObj['some prop name 3'])}
{/template}
```

#{/}

### target для массивов

Создание и редактирование массивов через *target* почти не отличается от объектов - просто не нужно указывать название ключа
и первый вызов *putIn* можно опустить, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- target [] as myArray
			< .hello
				Hello world!
		*
			< .hello
				Hello people!

	? console.log(myArray)
```

```classic
{namespace demo}
{template index()}
	{target [] as myArray}
		{*}
			{< .hello}
				Hello world!
			{/}
		{/}
		{*}
			{< .hello}
				Hello people!
			{/}
		{/}
	{/}

	{? console.log(myArray)}
{/template}
```

#{/}

### Вложенный target

Директива может ставить как свойство объекта другой *target*, который может устанавливать любое значение.

#{+= self.example()}

```jade-like
- namespace demo
- template index(val)
	- target [] as myArray
			- target {a: 1, b: 2}
		*
			- target 1 + 2

	? console.log(myArray)
```

```classic
{namespace demo}
{template index()}
	{target [] as myArray}
		{*}
			{target {a: 1, b: 2} /}
		{/}
		{*}
			{target 1 + 2 /}
		{/}
	{/}

	{? console.log(myArray)}
{/template}
```

#{/}

### target и [call](#call), [putIn](#putIn), [func](#func)

Директиву можно передавать как аргумент при вызове функции с помощью директивы *call*:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	+= someFunction()
		- target []
			Hello world!
```

```classic
{namespace demo}
{template index()}
	{+= someFunction()}
		{target []}
			Hello world!
		{/}
	{/}
{/template}
```

#{/}

Также *target* можно ставить как свойство объекта or массива через *putIn*, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var myObj = {}
	- putIn myObj.foo
		- target []
			Hello world!
```

```classic
{namespace demo}
{template index()}
	{var myObj = {} /}
	{putIn myObj.foo}
		{target []}
			Hello world!
		{/}
	{/}
{/template}
```

#{/}

И можно установить функцию как значение свойства объекта or элемент массива:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- target []
		() => a, b
			- return a + b
```

```classic
{namespace demo}
{template index()}
	{target []}
		{() => a, b}
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
