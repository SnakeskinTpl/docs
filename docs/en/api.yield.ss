- namespace docs.en.api['1::Directives']['15::Asynchronous directives']['4::yield']

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

Директива *yield* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration                       | Shorthand | Directive type       | Interpolation |
|----------------------------------|--------------------|---------------------|--------------|
| Только внутри шаблона-генератора | Absent        | Block, logic | Not required |

## Description

Директива используется вместе с шаблонами-генераторами для организации "прерывания", однако, Snakeskin не создаёт
полифил, а генерирует "чистый" JavaScript код, поэтому для поддержки старых браузеров используйте
[Regenerator](https://www.npmjs.com/package/regenerator) or [Babel](https://babeljs.io).

Директива начинается с ключевого слова `yield`, которое может сопровождаться ссылкой на возвращаемое значение или
выражение, например:

#{+= self.example()}

```jade-like
- namespace demo
- template *index()
	- yield 1 + 2
```

```classic
{namespace demo}
{template index()}
	{yield *1 + 2 /}
{/template}
```

#{/}

Для удобства использования *yield* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{yield 1 + 2}{/}

\/// Короткая форма закрытия
{yield 1 + 2 /}
```

Директива может использоваться только внутри шаблона-генератора.

### Расширенная декларация

Директива может включать возвращаемое значение в своё тело - это удобно, когда возвращаемое значение является подшаблоном,
например:

#{+= self.example()}

```jade-like
- namespace demo
- template *index()
	\/// Шаблон вернёт ссылку на функцию,
	\/// которая складывает два числа
	- yield
		() => a, b
			- return a + b
```

```classic
{namespace demo}
{template *index()}
	\/// Шаблон вернёт ссылку на функцию,
	\/// которая складывает два числа
	{yield}
		{() => a, b}
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..

#{/block}
{/template}
