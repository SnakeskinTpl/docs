- namespace docs.ru.api['Директивы']['Выполнение / вывод']['void']

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

Директива выполняет заданное выражение, но ничего не выводит в шаблон.

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | `?`                | Строковая     |

## Примеры

#{+= self.example()}

```jade-like
? console.log('hello world')
- template demo()
	: a = 0
	- void a++
	{a} \/// 1
```

```classic
{? console.log('hello world')}
{template demo()}
	{: a = 0}
	{void a++}
	{a} \/// 1
{/template}
```

#{/}

#{/block}
{/template}
