- namespace docs.en.api['1::Directives']['17::Разное']['3::continue']

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

Директивы пропускает такт выполнения другой директивы, с которой она находится в связи.

## Паспорт

| Декларация                         | Короткий синтаксис | Тип директивы         | Интерполяция |
|------------------------------------|--------------------|-----------------------|--------------|
| Только внутри специальных директив | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Поведение директивы *continue* зависит от контекста, например, если использовать её внутри циклов или итераторов,
то она будет немедленно прерывать текущую итерацию и переходить к следующей, а если использовать совместно
с асинхронными директивами, то *continue* будет осуществлять немедленный переход к следующей функции в цепи.

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
#### Использование с [for](#for)

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: 1, b: 2}
	- for var key in obj
		- if !obj.hasOwnProperty(key)
			- continue

		{key}
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}
	{for var key in obj}
		{if !obj.hasOwnProperty(key)}
			{continue}
		{/}
		{key}
	{/}
{/template}
```

#{/}

#### Использование с [waterfall](#waterfall)

#{+= self.example()}

```jade-like
- namespace demo

- import async from 'async'
- import fs from 'fs'

- template index(brk)
	- waterfall
		() => cb
			- if brk
				- continue 'foo.txt'

			...
			? cb('bar.txt')

		() => path, cb
			fs.readFile(path, cb)

	- final err, res
		...
```

```classic
{namespace demo}

{import async from 'async'}
{import fs from 'fs'}

{template index(brk)}
	{waterfall}
		{() => cb}
			{if brk}
				{continue 'foo.txt'}
			{/}

			...
			{? cb()}
		{/}

		{() => path, cb}
			fs.readFile(path, cb)
		{/}

	{final err, res}
		...
	{/}
{/template}
```

#{/}

#{/block}
{/template}
