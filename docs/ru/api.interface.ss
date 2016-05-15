- namespace docs.ru.api['1::Директивы']['1::Создание шаблона']['3::interface']

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

Директива декларирует шаблон-интерфейс c заданным именем и входными параметрами.

## Паспорт

| Декларация                                                                                 | Короткий синтаксис | Тип директивы                       | Интерполяция |
|--------------------------------------------------------------------------------------------|--------------------|-------------------------------------|--------------|
| Только в глобальной области, необходима предварительная декларация [namespace](#namespace) | Отсутствует        | Блочная, логическая, функциональная | Не требуется |

## Описание

Шаблон-интерфейс отличается от простого шаблона тем, что после трансляции в JS будет получена пустая функция с входными параметрами,
например:

#{+= self.example()}

```jade-like
- namespace demo
- interface index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{interface index(name = 'world')}
	Hello {name}!
{/interface}
```

#{/}

Превратится в:

```js
exports.demo.index = function index(name) {};
```

В остальном механика таких шаблонов полностью идентичная [template](#template).

#{/block}
{/template}
