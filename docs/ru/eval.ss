- namespace docs.ru.api['1::Директивы']['3::Глобальный контекст']['1::eval']

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

Директива создаёт блок, который выполнится на этапе трансляции, но не войдёт в конечный JS.

## Паспорт

| Декларация                  | Короткий синтаксис | Тип директивы       | Интерполяция |
|-----------------------------|--------------------|---------------------|--------------|
| Только в глобальной области | Отсутствует        | Блочная, логическая | Не требуется |

## Описание

Т.к. любой код, размещённый вне тела шаблона будет выполняться как на этапе трансляции, так и войдёт в конечный JS код,
то директива *eval* позволяет создать блок, содержимое которого будет исключаться из результирующего кода, но по прежнему
будет выполняться на этапе трансляции.

#{+= self.example()}

```jade-like
- eval
	? console.log('Hello world!')
```

```classic
{eval}
	{? console.log('Hello world!')}
{/}
```

#{/}

Директива может использоваться только в глобальной области.

#{/block}
{/template}
