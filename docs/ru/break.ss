- namespace docs.ru.api['1::Директивы']['17::Разное']['2::break']

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

Директивы прерывает выполнение другой директивы, с которой она находится в связи.

## Паспорт

| Декларация                         | Короткий синтаксис | Тип директивы         | Интерполяция |
|------------------------------------|--------------------|-----------------------|--------------|
| Только внутри специальных директив | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Поведение директивы *break* зависит от контекста, например, если использовать её внутри циклов или итераторов,
то она будет немедленно прерывать итерации, а если использовать совместно с асинхронными директивами, то *break* будет
осуществлять немедленный переход к результирующей функции.

Директива может использоваться только внутри директив:

* [for](#for);
* [while](#while);
* [do](#do);
* [forEach](#forEach);
* [forIn](#forIn);
* [series](#series);
* [parallel](#parallel);
* [waterfall](#waterfall).

### Примеры
#### Сброс [for](#for)

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: 1, b: 2}
	- for var key in obj
		{key}
		- break
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}
	{for var key in obj}
		{key}
		{break}
	{/}
{/template}
```

#{/}

#### Сброс [series](#series)

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index(brk)
	- series
		() => cb
			- if brk
				\/// Управление перейдёт в final c ошибкой
				- break new Error('Skipped')

			? cb()

		() => cb
			fs.readFile('foo.txt', cb)

	- final err, res
		...
```

```classic
{namespace demo}
{template index(brk)}
	{series}
		{() => cb}
			{if brk}
				\/// Управление перейдёт в final c ошибкой
				{break new Error('Skipped')}
			{/}

			{? cb()}
		{/}

		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

	{final err, res}
		...
	{/}
{/template}
```

#{/}

#{/block}
{/template}
