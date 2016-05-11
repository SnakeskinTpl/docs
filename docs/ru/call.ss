- namespace docs.ru.api['1::Директивы']['2::Выполнение / вывод']['2::call']

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

Директива выполняет заданное выражение и выводит результат в шаблон
(на выводимое выражение по умолчанию накладываются
[фильтр](guide.html#filters) [undef](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L232)).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы      | Интерполяция |
|-------------------------------------------|--------------------|--------------------|--------------|
| Только внутри шаблонов или внешних блоков | `+=`               | Блочная, текстовая | Не требуется |

## Описание

Директива *call* похожа на [output](#output), т.е. она тоже вставляет результат выражения в шаблон, однако, она не накладывает
по умолчанию на выводимые данные фильтр [html](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L175), т.е.
выводимое выражение не экранируется и это является аналогом использования фильтра `!html`.

Директива начинается с ключевого слова `call` (или символов `+=`), которое может сопровождаться ссылкой на возвращаемое значение или
выражение, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	+= 1 + 2
```

```classic
{namespace demo}
{template index()}
	{+= 1 + 2 /}
{/template}
```

#{/}

Для удобства использования *call* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{+= 1 + 2}{/}

\/// Короткая форма закрытия
{+= 1 + 2 /}
```

Главным кейзом использования *call* является вызов [блоков](#block) и других шаблонов внутри шаблона, поэтому выводимые
данные не экранируются, т.к. они уже и так экранированы, например:

#{+= self.example()}

```jade-like
- namespace demo

- template helper()
	< .foo
		Hello world!

- template index()
	\/// <div class="foo">Hello world!</div>
	+= @helper()

	\/// &lt;div class=&quot;foo&quot;&gt;Hello world!&lt;/div&gt;
	{@helper()}
```

```classic
{namespace demo}

{template helper()}
	{< .foo}
		Hello world!
	{/}
{/template}

{template index()}
	\/// <div class="foo">Hello world!</div>
	{+= @helper() /}

	\/// &lt;div class=&quot;foo&quot;&gt;Hello world!&lt;/div&gt;
	{@helper()}
{/template}
```

#{/}

Директива может использоваться только внутри шаблонов или внешних блоков.

### Расширенная декларация

Директива поддерживает специальную расширенную форму для передачи параметров-шаблонов в вызываемую функцию, например:

#{+= self.example()}

```jade-like
- namespace demo

- template helper(text)
	< .output
		{text}

- template index()
	\/// <div class="output"><div class="foo">Hello world!</div></div>
	+= @helper()
		< .hello
			Hello world!
```

```classic
{namespace demo}

{template helper(text)}
	{< .output}
		{text}
	{/}
{/template}

{template index()}
	\/// <div class="output"><div class="foo">Hello world!</div></div>
	{+= @helper()}
		{< .hello}
			Hello world!
		{/}
	{/}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..
Если необходимо передать несколько параметров, то нужно использовать директиву [putIn](#putIn):

#{+= self.example()}

```jade-like
- namespace demo

- template helper(text1, text2)
	< .output1
		{text1}

	< .output2
		{text2}

- template index()
	+= @helper()
		*
			< .hello
				Hello world!
		*
			< .goodbye
				Goodbye cruel world!
```

```classic
{namespace demo}

{template helper(text1, text2)}
	{< .output1}
		{text1}
	{/}

	{< .output2}
		{text2}
	{/}
{/template}

{template index()
	{+= @helper()}
		{*}
			{< .hello}
				Hello world!
			{/}
		{/}
		{*}
			{< .goodbye}
				Goodbye cruel world!
			{/}
		{/}
	{/}
{/template}
```

#{/}

Первый вызов *putIn* можно опустить:

#{+= self.example()}

```jade-like
- namespace demo

- template helper(text1, text2)
	< .output1
		{text1}

	< .output2
		{text2}

- template index()
	+= @helper()
			< .hello
				Hello world!
		*
			< .goodbye
				Goodbye cruel world!
```

```classic
{namespace demo}

{template helper(text1, text2)}
	{< .output1}
		{text1}
	{/}

	{< .output2}
		{text2}
	{/}
{/template}

{template index()
	{+= @helper()}
		{< .hello}
			Hello world!
		{/}
		{*}
			{< .goodbye}
				Goodbye cruel world!
			{/}
		{/}
	{/}
{/template}
```

#{/}

Допускается совмещать передачу параметров в обычной и расширенной форме.

#{+= self.example()}

```jade-like
- namespace demo

- template helper(a, b, text1, text2)
	{a + b}

	< .output1
		{text1}

	< .output2
		{text2}

- template index()
	+= @helper(1, 2)
			< .hello
				Hello world!
		*
			< .goodbye
				Goodbye cruel world!
```

```classic
{namespace demo}

{template helper(a, b, text1, text2)}
	{a + b}

	{< .output1}
		{text1}
	{/}

	{< .output2}
		{text2}
	{/}
{/template}

{template index()
	{+= @helper(1, 2)}
		{< .hello}
			Hello world!
		{/}
		{*}
			{< .goodbye}
				Goodbye cruel world!
			{/}
		{/}
	{/}
{/template}
```

#{/}

### Примеры
#### Передача функции-параметра с помощью [callback](#callback)

#{+= self.example()}

```jade-like
- namespace demo

- template helper(fn)
	+= fn(1, 2)

- template index()
	+= @helper()
		() => a, b
			{a + b}
```

```classic
{namespace demo}

{template helper(fn)}
	{+= fn(1, 2) /}
{/template}

{template index()
	{+= @helper()}
		{() => a, b}
			{a + b}
		{/}
	{/}
{/template}
```

#{/}

#### Передача объекта-параметра с помощью [target](#target)

#{+= self.example()}

```jade-like
- namespace demo

- template helper(@params)
	{@data}

- template index()
	+= @helper()
		- target {}
			* data
				< .hello
					Hello world!
```

```classic
{namespace demo}

{template helper(@params)}
	{@data}
{/template}

{template index()
	{+= @helper()}
		{target {}}
			{* data}
				{< .hello}
					Hello world!
				{/}
			{/}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
