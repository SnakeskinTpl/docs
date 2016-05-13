- namespace docs.ru.api['1::Директивы']['14::Создание литералов']['1::callback']

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

Директива декларирует анонимную функцию.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы                       | Интерполяция |
|-----------------|--------------------|-------------------------------------|--------------|
| Без ограничений | `()` или `() =>`   | Блочная, логическая, функциональная | Не требуется |

## Описание

Директива *callback* декларирует анонимную функцию-литерал и обычно используется в связи с другими директивами,
которые требуют аргумент-функцию, например, [series](#series) или [parallel](#parallel).

Директива начинается с ключевого слова `callback` (или символов `()` или `() =>`), которое может списком аргументов
функции через запятую, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	() => db
		? db.ping()
```

```classic
{namespace demo}
{template index()}
	{() => db}
		{? db.ping()}
	{/}
{/template}
```

#{/}

Параметров у такой функции может быть неограниченное количество, а т.к. директива *callback*
является функциональной, то она реализует [стандартный механизм декларации параметров](guide.html#introParams).
Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

### callback и [return](#return)

По умолчанию функции созданные через *callback* не возвращают никакого значения, поэтому для этого нужно использовать
директиву *return*, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	() => a, b
		- return a + b
```

```classic
{namespace demo}
{template index()}
	{() => a, b}
		{return a + b /}
	{/}
{/template}
```

#{/}

### callback и [var](#var)

Чтобы создать переменную с функциональным значением необходимо использовать конструкцию `var putIn`:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	\/// Мы создали функцию,
	\/// а затем присвоили её переменной calc
	- var putIn calc
		() => a, b
			- return a + b
```

```classic
{namespace demo}
{template index()}
	\/// Мы создали функцию,
	\/// а затем присвоили её переменной calc
	{var putIn calc}
		{() => a, b}
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

### callback и [call](#call), [target](#target), [putIn](#putIn)

Функцию можно передавать как аргумент при вызове другой функции с помощью директивы *call*:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	+= [1, 2, 3].map()
		() => el
			el = {el}
			- return getTplResult()
```

```classic
{namespace demo}
{template index()}
	\/// Мы создали функцию,
	\/// а затем присвоили её переменной calc
	{var putIn calc}
		{() => a, b}
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

Также функцию можно ставить как свойство объекта или массива через *target*, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- target {} as map
		* calc
			() => a, b
				- return a + b
```

```classic
{namespace demo}
{template index()}
	{target {} as map}
		{* calc}
			{() => a, b}
				{return a + b /}
			{/}
		{/}
	{/}
{/template}
```

#{/}

И можно установить/изменить значение свойства объекта или переменной на функцию с помощью *putIn*:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- target {} as map
	- putIn map.calc
		() => a, b
			- return a + b
```

```classic
{namespace demo}
{template index()}
	{target {} as map /}
	{putIn map.calc}
		{() => a, b}
			{return a + b}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
