- namespace docs.ru.guide['2::Основы']['3::Механизм фильтров']

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

## Общая концепция

Snakeskin поддерживает механизм фильтров - это более удобный и "сахарный" доступ к функциям
в пространстве имён [Snakeskin.Filters](https://github.com/kobezzza/Snakeskin/blob/master/lib/filters.es6#L53).

`{a|ucfirst}` ↔ `{Snakeskin.Filters['ucfirst'].call(this, a)}`

`{a + b|ucfirst}` ↔ `{Snakeskin.Filters['ucfirst'].call(this, a + b)}`

Допускается использовать последовательности фильтров

`{a + b|trim|ucfirst}` ↔

`{Snakeskin.Filters['ucfirst'].call(this, Snakeskin.Filters['trim'].call(this, a + b))}`

Фильтры можно накладывать отдельно на некоторые части выражения, для этого нужно обернуть декларацию в круглые скобки.

```
\/// Два локальных и один глобальный фильтр
{(a|ucfirst) + (b|ucfirst) |trim}
```

Фильтрам можно передавать параметры, на которые также можно применять фильтры и т.д..

```
{a|myFilter 1, (2 / 3|myFilter)}
```

По умолчанию при выводе значений через [output](#output) к ним применяется глобальный фильтр html
(экранирование html символов) и фильтр undef (замена `undefined` на пустые строки),
однако их выполнение можно отменить `{a|!html}` и `{a|!undef}`.

Механизм фильтров поддерживает большинство директив Snakeskin.

#{+= self.example()}

```jade-like
- var a = 'fooo '|trim

- if a|trim
	...
```

```classic
{var a = 'fooo '|trim}

{if a|trim}
	...
{/}
```

#{/}

Чтобы написать свой фильтр, достаточно добавить его в `Snakeskin.Filters`.
Название фильтра может начинаться с символа латинского алфавита, подчёркивания (`_`) и знака доллара (`$`).
Первым параметром функции будет значение выражения, а `this` внутри фильтра ссылается на `this` шаблона.

```js
Snakeskin.Filters['replace'] = function (str, search, replace) {
	return String(str).replace(search, replace);
};
```

Фильтры можно разбивать на внутренние пространства имён

```js
Snakeskin.Filters['text'] = {
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
};
```

```
{'foo'|text.replace 'fo', 'bar'}
```

Также для добавления своих фильтров можно воспользоваться методов `Snakeskin.importFilters`

```js
Snakeskin.importFilters({
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
});

// С указанием пространства имён
Snakeskin.importFilters({
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
}, 'my.foo.bar'); // my.foo.bar.repeat
```

### Переменная $_

Переменная `$_` содержит результат последней работы фильтра.

```
{' fooo '|trim}
{$_} \/// 'fooo'
```

### Примечание

Чтобы использовать в шаблоне побитовое ИЛИ (`|`) достаточно просто указать пробел после оператора `|`,
также если после оператора `|` идёт число, то можно писать как есть, т.к. название фильтра не может начинаться с числа.

```
{1|0}

{a = 1}
{1 | a}
```

#{/block}
{/template}
