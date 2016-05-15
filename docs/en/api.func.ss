- namespace docs.en.api['1::Directives']['14::Создание литералов']['1::func']

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

Директива *func* декларирует анонимную функцию-литерал и обычно используется в связи с другими директивами,
которые требуют аргумент-функцию, например, [series](#series) или [parallel](#parallel).

Директива начинается с ключевого слова `func` (или символов `()` или `() =>`), которое может сопровождаться списком аргументов
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

Параметров у такой функции может быть неограниченное количество, а т.к. директива *func*
является функциональной, то она реализует [стандартный механизм декларации параметров](#{@@guide}#introParams).
По умолчанию такие функции возвращают строки, однако это поведение можно поменять задав
специальный [renderMode](#compile--renderMode) или явно вернув значение через директиву [return](#return).
Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

### Стандартные переменные функции

Каждая директива *func* (за исключением тех, что используется совместно с асинхронными директивами) определяет ряд функций,
которые можно использовать в ней:

`getTplResult` - функция, которая возвращает результат работы директивы, также может принимать один логический входной
параметр, при задании которого после вызова функции результат работы директивы будет обнуляться;

`clearTplResult` - функция, которая обнуляет результат работы директивы.

### func и [var](#var)

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

### func и [call](#call), [target](#target), [putIn](#putIn)

Функцию можно передавать как аргумент при вызове другой функции с помощью директивы *call*:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	+= [1, 2, 3].map()
		() => el
			el = {el}
```

```classic
{namespace demo}
{template index()}
	{+= [1, 2, 3].map()}
		{() => el}
			el = {el}
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
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
