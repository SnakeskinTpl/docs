- namespace docs.en.api['1::Directives']['15::Директивы для асинхронной работы']['5::await']

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

Директива *await* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация                       | Короткий синтаксис | Тип директивы       | Интерполяция |
|----------------------------------|--------------------|---------------------|--------------|
| Только внутри шаблона-генератора | Отсутствует        | Блочная, логическая | Не требуется |

## Описание

Директива используется вместе с async-шаблонами для организации "прерывания", однако, Snakeskin не создаёт
полифил, а генерирует "чистый" JavaScript код, поэтому для поддержки старых браузеров используйте [Babel](https://babeljs.io).

Директива начинается с ключевого слова `await`, которое может сопровождаться ссылкой на ожидаемое значение или выражение, например:

#{+= self.example()}

```jade-like
- namespace demo
- async template index(db)
	- await db.getData()
```

```classic
{namespace demo}
{async template index(db)}
	{await db.getData() /}
{/template}
```

#{/}

Для удобства использования *await* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{await db.getData()}{/}

\/// Короткая форма закрытия
{await db.getData() /}
```

Директива может использоваться только внутри async-шаблона.

### Расширенная декларация

Директива может включать выражение в своё тело - это удобно, когда ожидаемое значение является подшаблоном,
например:

#{+= self.example()}

```jade-like
- namespace demo
- async template index(db)
	- await
		- block getData() =>
			- return db.getData()
```

```classic
{namespace demo}
{async template index()}
	{await}
		{block getData() =>}
			{return db.getData() /}
		{/}
	{/}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..

#{/block}
{/template}
