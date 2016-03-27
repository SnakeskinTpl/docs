- namespace docs.ru.api['Директивы']['Циклы']['3::do']

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

Директива **do** является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

## Описание

Директива создаёт цикл, т.е. блок цикла будет выполняется до тех пор, пока управляющее логическое
выражение не станет ложным или пока цикл не будет сброшен вручную. Отличие **do** от [while](#while) состоит в том,
что цикл `do-while` выполняется по крайней мере один раз, даже если условие изначально ложно.

Директива начинается с ключевого слова `do`, а выражение для проверки идёт после вложенного блока цикла вместе с
директивой **while** (заключать выражение в скобки не обязательно). Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- var i = 3
- do
	{i}
- while i--
```

```classic
{var i = 3}
{do}
	{i}
{while i--}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.
Для управления циклом внутри директивы можно использовать директивы:

1. **break** - полностью прерывает выполнение цикла;
2. **continue** - прерывает текущую итерацию и переходит к следующей.

### Примеры
#### Перебор массива

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var arr = [1, 2, 3]
	- do
		{arr[0]}
		? arr.shift()
	- while arr.length
```

```classic
{namespace demo}
{template index()}
	{var arr = [1, 2, 3]}
	{do}
		{arr[0]}
		{? arr.shift()}
	{while arr.length}
{/template}
```

#{/}

#### Бесконечный цикл

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var i = 0
	- do
		{i}
		? i++
```

```classic
{namespace demo}
{template index()}
	{var i = 0}
	{do}
		{i}
		{? i++}
	{/}
{/template}
```

#{/}

#### Сброй итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var i = 3
	- do
		{i}
		- break
	- while i--
```

```classic
{namespace demo}
{template index()}
	{var i = 3}
	{do}
		{i}
		{break}
	{while i--}
{/template}
```

#{/}

#{/block}
{/template}
