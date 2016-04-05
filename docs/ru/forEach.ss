- namespace docs.ru.api['Директивы']['Итераторы']['1::forEach']

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

Директива **forEach** итерирует заданный объект (с учётом *hasOwnProperty*) или массив.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

## Описание

Директива итерирует заданное значение с помощью функции
[Snakeskin.forEach](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/live.js#L239) и может работать
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

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.
Для управления обходом внутри итератора можно использовать директивы:

1. **break** - полностью прерывает выполнение итератора;
2. **continue** - прерывает текущую итерацию и переходит к следующей.

### Параметры для массива

1. Эначение элемента;
2. Номер итерации;
3. Ссылка на итерируемый массив;
4. Является ли элемент первым;
5. Является ли элемент последним;
6. Длина массива.

### Параметры для таблицы

1. Эначение элемента;
2. Ключ;
3. Ссылка на итерируемый объект;
4. Номер итерации;
5. Является ли элемент первым;
6. Является ли элемент последним;
7. Количество элементов в объекте.

### forEach и return

Несмотря на то что *forEach* использует функцию при обходе объекта, поведение директивы приближено к поведению цикла,
т.е. внутри можно использовать директивы *break*, *continue* и **return**, принцип работы которых не будет отличаться,
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
		{return el}
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
	{var arr = [1, 2, 3]}
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
	{var arr = [{name: 'Koba'}, {name: 'Over'}]}
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
	{var obj = {a: 1, b: 2}}
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
