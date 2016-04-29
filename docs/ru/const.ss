- namespace docs.ru.api['Директивы']['4::Переменные']['2::const']

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

Директива создаёт константу с указанным именем и значением.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы                     | Интерполяция |
|-------------------------------------------|--------------------|-----------------------------------|--------------|
| Только внутри шаблонов или внешних блоков | Не требуется       | Строковая, текстовая / логическая | Не требуется |

## Описание

Константы Snakeskin не имеют ничего общего с константами из JS ES2015 и служат для других целей.
Константы глобальны в рамках своего шаблона, поэтому не может быть 2-х констант с одинаковым именем.
Значение константы может меняться по ходу выполнения шаблона.

При декларации константы не требуется специального ключевого слова (хотя допускается), например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- val = 'hello'
	{val}
```

```classic
{namespace demo}
{template calc(a, b)}
	{val = 'hello'}
	{val}
{/template}
```

#{/}

С логической точки зрения константы Snakeskin - это свойства класса (шаблона), т.е. они доступны в любом месте шаблона
и их можно [переопределять в дочернем шаблоне](guide.html#inheritConsts).
Константа может быть свойством объекта (включая свойство другой константы), например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- val = {}
	- val.name = 'Kobezzza'
```

```classic
{namespace demo}
{template calc(a, b)}
	{val = {}}
	{val.name = 'Kobezzza'}
{/template}
```

#{/}

После декларации константы станет невозможным в рамках шаблона объявление переменной с таким же именем.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- val = {}
	- var val = 1 \/// Ошибка
```

```classic
{namespace demo}
{template calc(a, b)}
	{val = {}}
	{var val = 1 /} \/// Ошибка
{/template}
```

#{/}

Константы могут создаваться только внутри шаблонов или внешних блоков.

### Распад константы

Если любая [функциональная директива](guide.html#introParams) содержит параметр с именем равным константе, то он "замещает" константу в рамках
своей блочной области видимости, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- val = {}
	- forEach [1, 2] => val
		{val} \/// 1, 2
```

```classic
{namespace demo}
{template calc(a, b)}
	{val = {}}
	{forEach [1, 2] => val}
		{val} \/// 1, 2
	{/}
{/template}
```

#{/}

### Вызываемые константы

Если в конце декларации константы поставить символ `?`, то её значение сразу же выведется в шаблон.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	< title
		- title = 'Главная страница' ?
```

```classic
{namespace demo}
{template calc(a, b)}
	{< title}
		{title = 'Главная страница' ?}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
