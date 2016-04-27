- namespace docs.ru.api['Директивы']['2::Выполнение / вывод']['1::output']

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
(на выводимое выражение по умолчанию накладываются [фильтры](guide.html#filters)
[html](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L175) и
[undef](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/filters.js#L232)).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы         | Интерполяция |
|-------------------------------------------|--------------------|-----------------------|--------------|
| Только внутри шаблонов или внешних блоков | Не требуется       | Строковая, текстовая  | Не требуется |

## Описание

Директива **output** используется когда нам нужно вывести в текст шаблона значение переменной или выражения.

Директива не требует специального ключевого слова (хотя допускается), поэтому достаточно просто взять выводимое
выражение в фигурные скобки, например:

#{+= self.example()}

```jade-like
- namespace demo
- template calc(a, b)
	a + b = {a + b}
```

```classic
{namespace demo}
{template calc(a, b)}
	a + b = {a + b}
{/template}
```

#{/}

Однако нужно следить, чтобы первое слово выводимого выражения не было равно имени другой директивы Snakeskin,
иначе возникнет ошибка:

#{+= self.example()}

```jade-like
- namespace demo
- template index(link)
	{link} \/// Ошибка
```

```classic
{namespace demo}
{template index(link)}
	{link} \/// Ошибка
{/template}
```

#{/}

Для того чтобы пример выше отработал корректно достаточно просто взять наше выражение в круглые скобки:

#{+= self.example()}

```jade-like
- namespace demo
- template index(link)
	{(link)}
```

```classic
{namespace demo}
{template index(link)}
	{(link)}
{/template}
```

#{/}

Внутри *output* можно использовать вызовы функций, тернарные операторы и т.д..

#{+= self.example()}

```jade-like
- namespace demo
- template calc(a, b)
	{a > 1 ? --a * b : Math.random() * b}
```

```classic
{namespace demo}
{template calc(a, b)}
	{a > 1 ? --a * b : Math.random() * b}
{/template}
```

#{/}

На всё выводимое выражение по умолчанию накладывается специальный фильтр *html*, который экранирует html сущности, а также
фильтр *undef* на каждый отдельный чанк выражения, который преобразует значение `undefined` в `''`.
Чтобы отменить это поведение нужно использовать фильтры `!html` и `!undef` или задать глобальное через
параметр трансляции [filters](#compile--filters).

#{+= self.example()}

```jade-like
- namespace demo
- template index(val1, val2)
	{(val1|!undef) + (val2|!undef) |!html}
```

```classic
{namespace demo}
{template index(val1, val2)}
	{(val1|!undef) + (val2|!undef) |!html}
{/template}
```

#{/}

Директива может использоваться только внутри шаблонов или внешних блоков.

#{/block}
{/template}
