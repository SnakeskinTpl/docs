- namespace docs.en.api['1::Directives']['7::Циклы']['1::for']

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

Директива *for* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива создаёт цикл, т.е. блок цикла будет выполняется до тех пор, пока управляющее логическое
выражение не станет ложным or пока цикл не будет сброшен вручную. Директива проводит инициализацию перед первым шагом цикла.
Затем выполняется проверка условия цикла, и в конце каждой итерации происходит изменение управляющей переменной.

```js
for инициализация; логическое выражение (условие); шаг (итерация)
	команда
```

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- for var i = 0; i < 3; i++
	Итерация - {i}
```

```classic
{for var i = 0; i < 3; i++}
	Итерация - {i}
{/for}
```

#{/}

The directive can be used anywhere.
Для управления циклом внутри блока можно использовать директивы:

1. [break](#break) - полностью прерывает выполнение цикла;
2. [continue](#continue) - прерывает текущую итерацию и переходит к следующей.

### Examples
#### Простой перебор массива

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var arr = [1, 2, 3]

	\/// Т.к. переменные Snakeskin имеют блочную область видимости,
	\/// то i будет доступен только внутри for
	- for var i = 0; i < arr.length; i++
		{arr[i]}
```

```classic
{namespace demo}
{template index()}
	{var arr = [1, 2, 3] /}

	\/// Т.к. переменные Snakeskin имеют блочную область видимости,
	\/// то i будет доступен только внутри for
	{for var i = 0; i < arr.length; i++}
		{arr[i]}
	{/}
{/template}
```

#{/}

#### Простой перебор объекта

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: 1, b: 2}

	\/// Т.к. переменные Snakeskin имеют блочную область видимости,
	\/// то key будет доступен только внутри for
	- for var key in obj
		{key}
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}

	\/// Т.к. переменные Snakeskin имеют блочную область видимости,
	\/// то key будет доступен только внутри for
	{for var key in obj}
		{key}
	{/}
{/template}
```

#{/}

#### Сброс итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: 1, b: 2}
	- for var key in obj
		- if !obj.hasOwnProperty(key)
			- continue

		{key}
		- break
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}
	{for var key in obj}
		{if !obj.hasOwnProperty(key)}
			{continue}
		{/}

		{key}
		{break}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
