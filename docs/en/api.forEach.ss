- namespace docs.en.api['1::Directives']['8::Итераторы']['1::forEach']

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

Директива итерирует заданный объект (с учётом *hasOwnProperty*) или массив.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы                       | Интерполяция |
|-----------------|--------------------|-------------------------------------|--------------|
| Без ограничений | Отсутствует        | Блочная, логическая, функциональная | Не требуется |

## Описание

Директива итерирует заданное значение с помощью функции
[Snakeskin.forEach](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/live.js#L245) и может работать
как с объектами, так и с массивами.

Общая форма директивы следующая:

```js
forEach ссылка на объект или сам объект => параметры функции через запятую
	команда
```

Например:

#{+= self.example()}

```jade-like
- forEach [1, 2, 3] => el
	{el}
```

```classic
{forEach [1, 2, 3] => el}
	{el}
{/forEach}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области,
а т.к. *forEach* является функциональной директивой, то он реализует [стандартный механизм декларации параметров](guide#{@@prfx}.html#introParams).

Для управления обходом внутри итератора можно использовать директивы:

1. [break](#break) - полностью прерывает выполнение итератора;
2. [continue](#continue) - прерывает текущую итерацию и переходит к следующей.

### Параметры для массива

1. Значение элемента;
2. Номер итерации;
3. Ссылка на итерируемый массив;
4. Объект:
	* `isFirst` - является ли элемент первым;
	* `isLast` - является ли элемент последним;
	* `length` - длина массива.

### Параметры для таблицы

1. Значение элемента;
2. Ключ;
3. Ссылка на итерируемый объект;
4. Объект:
	* `i` - номер итерации;
	* `isFirst` - является ли элемент первым;
	* `isLast` - является ли элемент последним;
	* `length` - длина массива.

### forEach и [return](#return)

Несмотря на то что *forEach* использует функцию при обходе объекта, поведение директивы приближено к поведению цикла,
т.е. внутри можно использовать директивы *break*, *continue* и *return*, принцип работы которых не будет отличаться,
например:

#{+= self.example()}

```jade-like
- namespace demo

\/// Шаблон вернёт 1
- template index()
	- forEach [1, 2, 3] => el
		- return el
	Hello world
```

```classic
{namespace demo

\/// Шаблон вернёт 1
{template index()}
	{forEach [1, 2, 3] => el}
		{return el /}
	Hello world
```

#{/}

### Примеры
#### Простой перебор массива

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var arr = [1, 2, 3]
	- forEach arr => el
		{el}
```

```classic
{namespace demo}
{template index()}
	{var arr = [1, 2, 3] /}
	{forEach arr => el}
		{el}
	{/}
{/template}
```

#{/}

#### Перебор массива с заданием [with](#with) в списке входных параметров

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var arr = [{name: 'Koba'}, {name: 'Over'}]
	- forEach arr => @el
		{@name}
```

```classic
{namespace demo}
{template index()}
	{var arr = [{name: 'Koba'}, {name: 'Over'}] /}
	{forEach arr => @el}
		{@name}
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
	- forEach obj => el, key
		{el} {key}
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}
	{forEach obj => el, key}
		{el} {key}
	{/}
{/template}
```

#{/}

#### Сброс итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- forEach [1, 2, 3] => el
		{el}
		- break
```

```classic
{namespace demo}
{template index()}
	{forEach [1, 2, 3] => el}
		{el}
		{break}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
