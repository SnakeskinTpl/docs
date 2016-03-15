- namespace docs.ru.api['Директивы']['Логические директивы']['2::unless']

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

Директива вставляет код `if !(...)` блока.

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

**Дополнительные директивы**:

* `else`
* `else if`
* `else unless` (аналог `else if !(...)`)

## Примеры

#{+= self.example()}

```jade-like
: a = 3
- unless a >= 3
	? console.log('a < 3')

- else unless a <= 3
	? console.log('a > 3')

- else
	? console.log('a == 3')
```

```classic
{: a = 3}
{unless a >= 3}
	{? console.log('a < 3')}

{else unless a <= 3}
	{? console.log('a > 3')}

{else}
	{? console.log('a == 3')}

{/unless}
```

#{/}

#{/block}
{/template}
