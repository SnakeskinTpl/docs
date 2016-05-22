- namespace docs.en.guide['2::Basics']['2::Jade-like синтаксис']

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

Помимо [основного](#basics--Синтаксис_управляющих_конструкций) синтаксиса Snakeskin поддерживает также альтернативный,
который основан на принципе управляющих пробелов и по духу близок к [Jade](https://github.com/visionmedia/jade) и
[HAML](https://github.com/haml/haml). Такой синтаксис крайне удобен при генерации XML подобных структур, например:

```jade-like
- template hello(name)
	< h1.foo
		< span style = color: red
			Hello {name}!
```

Вместо символов `{`, `}` для вывода директивы используется `-`.
В примерах документации основной синтаксис будет называться **classic**, а альтернативный - **jade-like**.

**"Классический" синтаксис:**

```classic
{namespace demo}
{template index(name)}
	{if name}
		{name}
	{/}
{/template}
```

**Jade-like синтаксис:**

```jade-like
- namespace demo
- template index(name)
	- if name
		{name}
```

Следует заметить, что в jade-like синтаксисе нет необходимости ставить закрывающие теги для блочных директив,
т.к. они проставляются автоматически.

Если директива имеет короткий синтаксис, то тогда управляющий символ `-` может быть опущен, например:

```jade-like
\/// - var foo = 'bar'
: foo = 'bar'
\/// - void foo = 'bar'
? console.log(foo)
```

## Расширенный синтаксис

Для использования [расширенного синтаксиса](#basics--Расширенный_синтаксис) используется символ `#` вместо `-`,
причём управляющий символ должен писаться всегда (в том числе и для короткого синтаксиса директив).

```jade-like
: foo = true
# if true
	#? console.log(foo)
```

## Смешивание синтаксисов

Jade-like синтаксис можно использовать совместно с классическим, при этом классический синтаксис может включаться
в блоки с декларацией jade-like, например:

```jade-like
\/// Альтернативный синтаксис
- namespace demo

\/// Классический синтаксис
{template index()}
  ....
{/template}

\/// Альтерантивный синтаксис с включением классического
- template wrapper(name)
	Hello {name}!
```

## Многострочная декларация

В случае, если необходимо разбить тело директивы на несколько строк,
то используется конструкция `& ... .` (перед символами необходимо ставить пробел), например:

```jade-like
- template hello(name)
	< h1.foo &
		style =
			color: red;
			text-decoration: underline
	.
		{name}
```

## Инлайновая декларация

Содержимое директивы можно задать на одной строке с декларацией после символов ` :: `
(обязательное выделение пробелами с обеих сторон; после спецсимвола можно использовать только классический синтаксис).

```jade-like
- template hello(name)
	< h1.foo :: {name}
```

Однако, при многострочной декларации директивы такой синтаксис невозможен.

## Символ текста

Специальный символ `|` в начале строки декларирует, что вся строка является простым текстом
(внутри которого по прежнему можно использовать классический синтаксис), а сам символ игнорируется, например:

```
- template hello(name)
	- if true :: Hello world! \/// Hello world!
	|- if true :: Hello world! \/// - if true :: Hello world!
```

Следует отметить, что также для этой цели можно использовать универсальный символ экранирования `\\`:

```
- template hello(name)
	\\- if true :: Hello world! \/// - if true :: Hello world!
```

Т.е. можно использовать любой из способов.

#{/block}
{/template}
