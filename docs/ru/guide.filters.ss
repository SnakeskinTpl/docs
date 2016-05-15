- namespace docs.ru.guide['2::Основы']['5::Механизм фильтров']

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

Фильтром Snakeskin называется функция, которая лежит в пространстве имён **Snakeskin.Filters**, а для вызова
такой функции используется специальный "сахарный" синтаксис. Сам механизм фильтров идеологически близок к реализации в
Bash, т.е. для вызова фильтра используется символ вертикальной черты (`|`), после которого идёт название фильтра и его параметры.
Следует отметить, что между символом фильтра и названием не должно быть пробелов, иначе это будет трактоваться парсером
как "побитовое или".

Например:

```classic
\/// Snakeskin.Filters['ucfirst'].call(this, 'hello' + ' world')
{'hello' + ' world'|ucfirst}
```

Как и в Bash, фильтры Snakeskin могут создавать конвейерные последовательности:

```classic
{' hello '|trim|ucfirst}
```

Фильтры можно накладывать отдельно на некоторые части выражения, для этого нужно обернуть декларацию в круглые скобки:

```classic
\/// Два локальных и один глобальный фильтр,
\/// который применится на всё выражение
{(a|ucfirst) + (b|ucfirst) |trim}
```

Фильтрам можно передавать параметры, на которые также можно применять фильтры и т.д..

```classic
{a|myFilter 1, (2 / 3|myFilter)}
```

По умолчанию при выводе значений через [output](#output) к ним применяется глобальный фильтр html
(экранирование html символов) и фильтр undef (замена `undefined` на пустые строки),
однако их выполнение можно отменить `{a|!html}` и `{a|!undef}`.

Механизм фильтров поддерживает большинство директив Snakeskin, например:

#{+= self.example()}

```jade-like
- var a = 'fooo '|trim

- if a|trim
	...
```

```classic
{var a = 'fooo '|trim /}

{if a|trim}
	...
{/}
```

#{/}

## Фильтры входных параметров

Фильтры Snakeskin можно назначать на любые входные параметры функциональных директив
([template](api#{@@prfx}.html#template), [forEach](api#{@@prfx}.html#forEach) и т.д.), например:

#{+= self.example()}

```jade-like
- template demo((a|trim), (b|trim|remove 'foo'))
```

```classic
{template demo((a|trim), (b|trim|remove 'foo'))}
{/template}
```

#{/}

Обратите внимание, что фильтр параметра берётся в круглые скобки.

### Фильтры значений по умолчанию

На значения по умолчанию для параметров можно также накладывать фильтры, причём если у самого параметра есть свои фильтры,
то они применятся после, например:

#{+= self.example()}

```jade-like
- template demo((a|trim) = ('fooBar'|remove 'foo'))
```

```classic
{template demo((a|trim) = ('fooBar'|remove 'foo')}
{/template}
```

#{/}

## Пользовательский фильтр

Чтобы написать свой фильтр, достаточно добавить его в *Snakeskin.Filters*.
Название фильтра может начинаться с символа латинского алфавита, подчёркивания (`_`) или знака доллара (`$`).
Первым параметром функции будет значение выражения, а *this* внутри фильтра ссылается на *this* шаблона.

```js
Snakeskin.Filters['replace'] = function (str, search, replace) {
	return String(str).replace(search, replace);
};
```

Фильтры можно разбивать на внутренние пространства имён:

```js
Snakeskin.Filters['text'] = {
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
};
```

```classic
{'foo'|text.replace 'fo', 'bar'}
```

Также для добавления своих фильтров можно воспользоваться методом
[Snakeskin.importFilters](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L22):

```js
Snakeskin.importFilters({
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
});

// С указанием пространства имён
// my.foo.bar.repeat
Snakeskin.importFilters({
	'replace': function (str, search, replace) {
		return String(str).replace(search, replace);
	}
}, 'my.foo.bar');
```

### Дополнительные параметры фильтров

При декларации фильтра ему можно задать ряд дополнительных параметров, например, чтобы фильтр отменял выполнение фильтров
по умолчанию. Для этого используется специальный метод
[Snakeskin.setFilterParams](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L46),
который первым параметром принимает название фильтра, а вторым объект с настройками.

```js
Snakeskin.importFilters({
	myFilter: function (str, getTplResult) {
		return str + getTplResult();
	}
});

Snakeskin.setFilterParams('myFilter', {
	// Прокидываем функцию getTplResult из шаблона в фильтр
	bind: ['getTplResult'],

	// Отменяем фильтр html по умолчанию
	'!html': true,

	// Отменяем фильтр undef по умолчанию
	'!undef': true,

	// Указывает, что фильтр не меняет исходное значение так,
	// что это может привести к появлению XSS, т.е. фильтр безопасный,
	// например таким фильтром является trim
	'safe': true
});
```

Обратите внимание, что такие параметры должны задаваться **до** трансляции шаблона.

## Переменная $_

Переменная **$_** содержит результат последней работы фильтра.

```classic
{' fooo '|trim}
{$_} \/// 'fooo'
```

## Примечание

Чтобы использовать в шаблоне побитовое ИЛИ (`|`) достаточно просто указать пробел после оператора `|`,
также если после оператора `|` идёт число, то можно писать как есть, т.к. название фильтра не может начинаться с числа.

```
{1|0}

{a = 1}
{1 | a}
```

## Встроенные фильтры

В стандартном runtime библиотеки Snakeskin присутствует ряд базовых фильтров, которые могут быть полезны при разработке
шаблонов, [подробнее](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js).

#{/block}
{/template}
