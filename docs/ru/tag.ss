- namespace docs.ru.api['Директивы']['Работа с HTML/XML']['3::tag']

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

Директива **tag** вставляет код декларации HTML/XML тега по заданным параметрам.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы      |
|-------------------------------------------|--------------------|--------------------|
| Только внутри шаблонов или внешних блоков | `<`                | Блочная, текстовая |

## Описание

Директива *tag* является универсальным инструментом для генерации XML подобных структур.
Общая форма директивы следующая:

```js
tag название директивы
```

Например:

#{+= self.example()}

```jade-like
- tag span
< span
```

```classic
{tag span}{/tag}
{< span}{/}
```

#{/}

При использовании *tag* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{tag input type = text}{/}

\/// Короткая форма закрытия
{tag input type = text /}
```

### Создание элемента с заданием классов и ИД

Для удобного задания классов и ИД-а в *tag* используется синтаксис селекторов CSS, например:

#{+= self.example()}

```jade-like
< span#baz.foo.bar
\/// Если не указать имя создаваемого тега,
\/// то будет использоваться div
< .bla
```

```classic
{< span#baz.foo.bar}{/}
\/// Если не указать имя создаваемого тега,
\/// то будет использоваться div
{< .bla}{/}
```

#{/}

### Задание произвольных атрибутов

Директива *tag* поддерживает задание атрибутов с помощью [attr](#attr), например:

#{+= self.example()}

```jade-like
< input value = foo | disabled
```

```classic
{< input value = foo | disabled /}
```

#{/}

Отрендерится как:

```html
<input value="foo" disabled>
```

### Ссылки на родительский класс

В Snakeskin существует специальный механизм получения значения родительского класса в дочернем теге, который называется
"липкая ссылка". Принцип работы следующий: если при декларации тега задать имя класса, которое начинается с символа `&`,
то он будет заменён на ближайший родительский класс, который декларировался без этого символа, например:

#{+= self.example()}

```jade-like
< .foo
	< .&__bar
	< .&__bla
```

```classic
{< .foo}
	{< .&__bar}{/}
	{< .&__bla}{/}
{/}
```

#{/}

Отрендерится как:

```html
<div class="foo">
	<div class="foo__bar"></div>
	<div class="foo__bla"></div>
</div>
```

При реализации этого механизма используется специальный фильтр [bem](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L453),
который можно перегрузить и добавить дополнительную логику.

#### Ссылка на родительский класс в произвольном атрибуте

Альтернативным способом получения липкой ссылки является вызов внутренней переменной шаблона `$class`, например:

#{+= self.example()}

```jade-like
< .foo value = ${$class}
```

```classic
{< .foo value = ${$class}}{/}
```

#{/}

Отрендерится как:

```html
<div class="foo" value="foo"></div>
```

#### Локальные ссылки

Если поместить декларацию класса в специальную конструкцию `[...]`, то классы заданные внутри такого блока не будут
запоминаться как липкая ссылка, а также плейсхолдер `&` будет ссылаться на ближайший по иерархии вложенности класс слева.

#{+= self.example()}

```jade-like
< .b-button[.g-helper]
	< button.&__elem[.&__focused_true]
```

```classic
{< .b-button[.g-helper]}
	{< button.&__elem[.&_focused_true]}{/}
{/}
```

#{/}

Отрендерится как:

```html
<div class="b-button g-helper">
	<button class="b-button__elem b-button__elem_focused_true"></button>
</div>
```

### Тег-плейсходер

Специальный тег `?` существует только на этапе трансляции и не включается в конечный код, например:

#{+= self.example()}

```jade-like
< ?.b-button
	< button.&__elem
```

```classic
{< ?.b-button}
	{< button.&__elem}{/}
{/}
```

#{/}

Отрендерится как:

```html
<button class="b-button__elem"></button>
```

### Интерполяция

Директива поддерживает механизм интерполяции значений, т.е. есть возможность пробрасывать вычисляемые значения внутрь декларации и
для этого используется специальный синтаксис `${выражение}`.

#{+= self.example()}

```jade-like
- var name = 'span'
< ${name}
```

```classic
{var name = 'foo' /}
{< ${name}}{/}
```

#{/}

Допускается смешивать интерполяцию с обычной декларацией:

#{+= self.example()}

```jade-like
- var name = 'foo'
< .${name}-bla.bar
```

```classic
{var name = 'foo' /}
{< .${name}-bla.bar}{/}
```

#{/}

Для интерполяции в атрибутах используется механизмы [attr](#attr--Интерполяция).

#### Интерполяция и тег-плейсхолдер

#{+= self.example()}

```jade-like
< ${'?'}.b-button
	< button.&__elem
```

```classic
{< ${'?'}.b-button}
	{< button.&__elem}{/}
{/}
```

#{/}

Отрендерится как:

```html
<button class="b-button__elem"></button>
```

### "Инлайновые" теги

В HTML ряд тегов не требуют закрывающей части (`</tag>`), например, [input](http://htmlbook.ru/html/input) или [meta](http://htmlbook.ru/html/meta),
причём если в XHTML такие теги закрываются явно, например:

```html
<input type="text" />
```

То в HTML это можно опустить:

```html
<input type="text">
```

Snakeskin знает про такие теги, а способ их закрытия зависит от выбранного [doctype](#doctype).
Правила декларации заданы в объекте [Snakeskin.inlineTags](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/live.js#L184),
структура следующая:

```js
Snakeskin.inlineTags = {
	// Название используемого doctype
	'html': {
		// Тег br ставится инлайновым
		'br': true,

		// Тег input ставится инлайновым,
		// причём если вставить содержимое в такой тег, например,
		//
		// < input
		//   Hello world!
		//
		// то оно поставится как значение атрибута value
		'input': 'value'
	}
}
```

Если для заданного doctype нет своей схемы тегов, то используется `html`.

#### Локальная декларация инлайновых тегов

С помощью модификатора `!inline` любой тег можно сделать принудительно инлайновым, например:

#{+= self.example()}

```jade-like
< textarea!inline
```

```classic
{< textarea!inline /}
```

#{/}

Отрендерится как:

```html
<textarea>
```

Также можно задать локальную схему тегов, которая будет распространяться на все сложенные теги:

#{+= self.example()}

```jade-like
- var val = {textarea: true}
< div!inline=val
	< textarea
```

```classic
{var val = {textarea: true} /}
{< div!inline=val}
	{< textarea /}
{/}
```

#{/}

Отрендерится как:

```html
<div><textarea></div>
```

#### Полиморфизм тегов

При разработке шаблонов часто бывает такая ситуация, когда имя создаваемого тега зависит от различных параметров, и для решения
такой задачи удобно использовать интерполяцию, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	< ${area ? 'textarea' : 'input'}.input
		{value}
```

```classic
{namespace demo}
{template index(value, area)}
	{< ${area ? 'textarea' : 'input'}.input}
		{value}
	{/}
{/template}
```

#{/}

Snakeskin поймёт такую конструкцию и в случае textarea создаст код вида:

```html
<textarea class="input">значение</textarea>
```

А в случае input:

```html
<input class="input" value="значение">
```

### Экранирование

Для экранирования спецсимволов директивы используется символ `\\`, например:

#{+= self.example()}

```jade-like
< .bla foo = bar \\= bla
```

```classic
{< .bla foo = bar \\= bla}{/}
```

#{/}

#{/block}
{/template}
