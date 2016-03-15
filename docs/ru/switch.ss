- namespace docs.ru.api['Директивы']['Логические директивы']['3::switch']

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

Директива вставляет код `switch-case` блока (break ставится автоматически после каждого **case**).

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | `>` (для **case**) | Блочная       |

**Дополнительные директивы**:

* `case`
* `default`

## Примеры

#{+= self.example()}

```jade-like
: a = 3
- switch a
	- case 1
		? console.log('a == 1')

	- case 2
		? console.log('a == 2')

	> 3
		? console.log('a == 3')

	- default
		? console.log('default')
```

```classic
{: a = 3}
{switch a}
	{case 1}
		{? console.log('a == 1')}
	{/case}

	{case 2}
		{? console.log('a == 2')}
	{/case}

	{> 3}
		{? console.log('a == 3')}
	{/>}

	{default}
		{? console.log('default')}
	{/default}
{/switch}
```

#{/}

#{/block}
{/template}
