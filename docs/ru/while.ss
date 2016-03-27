- namespace docs.ru.api['Директивы']['Циклы']['2::while']

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

Директива **while** является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

## Описание

Директива создаёт цикл, т.е. блок цикла будет выполняется до тех пор, пока управляющее логическое
выражение не станет ложным или пока цикл не будет сброшен вручную.

Директива начинается с ключевого слова `while`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно). Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- var i = 3
- while i--
	{i}
```

```classic
{var i = 3}
{while i--}
	{i}
{/while}
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
- var arr = [1, 2, 3]
- while arr.length
	{arr[0]}
	? arr.shift()
```

```classic
{var arr = [1, 2, 3]}
{while arr.length}
	{arr[0]}
	{? arr.shift()}
{/while}
```

#{/}

#### Сброй итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var i = 3
	- while i--
		{i}
		- break
```

```classic
{namespace demo}
{template index()}
	{var i = 3}
	{while i--}
		{i}
		{break}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
