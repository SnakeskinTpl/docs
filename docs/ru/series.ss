- namespace docs.ru.api['1::Директивы']['15::Директивы для асинхронной работы']['1::series']

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

Директива является фасадом для [Async.series](https://www.npmjs.com/package/async#seriestasks-callback).

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы       | Интерполяция |
|-----------------|--------------------|---------------------|--------------|
| Без ограничений | Отсутствует        | Блочная, логическая | Не требуется |

## Описание

Директива является обёрткой над функцией series библиотеки Async и позволяет создавать удобные цепочки
асинхронных вызовов. Вместе с директивой *series* должна использоваться директива [callback](#callback).
Перед использованием директивы необходимо подключить через [import](#import) саму библиотеку Async, например:

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index()
	- series
		() => cb
			fs.readFile('foo.txt', cb)

		() => cb
			fs.readFile('bar.txt', cb)
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index()}
	{series}
		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

		{() => cb}
			fs.readFile('bar.txt', cb)
		{/}
	{/}
{/template}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области. Вместе с основной
директивой можно использовать дополнительные:

1. `final` - второй параметр Async.series.

Для управления переходами внутри блока можно использовать директивы:

1. [break](#break) - прерывает выполнение операции и переходит в *final* (если он задан), может принимать параметр;
2. [continue](#continue) - прерывает выполнение текущей функции и переходит к следующей (если она если) или
к *final* (если он задан), может принимать параметр.

### Примеры
#### Задание final

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index()
	- series
		() => cb
			fs.readFile('foo.txt', cb)

		() => cb
			fs.readFile('bar.txt', cb)

	- final err, files
		? console.log(err, files)
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index()}
	{series}
		{() => cb}
			fs.readFile('foo.txt', cb)
		{/}

		{() => cb}
			fs.readFile('bar.txt', cb)
		{/}

	{final err, res}
		{? console.log(err, files)}
	{/}
{/template}
```

#{/}

#### Сброс операции

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index(brk)
	- series
		() => cb
			- if brk
				- break new Error('Skipped')

			? cb()

		() => cb
			fs.readFile('foo.txt', cb)

	- final err, res
		...
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index(brk)}
	{series}
		{() => cb}
			{if brk}
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
