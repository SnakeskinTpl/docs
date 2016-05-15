- namespace docs.en.api['1::Directives']['1::Создание шаблона']['4::placeholder']

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

Директива декларирует шаблон-плейсхолдер c заданным именем и входными параметрами.

## Паспорт

| Декларация                                                                                 | Короткий синтаксис | Тип директивы                       | Интерполяция |
|--------------------------------------------------------------------------------------------|--------------------|-------------------------------------|--------------|
| Только в глобальной области, необходима предварительная декларация [namespace](#namespace) | Отсутствует        | Блочная, логическая, функциональная | Не требуется |

## Описание

Шаблон-плейсхолдер отличается от простого шаблона тем, что он существует только на этапе трансляции и не будет включён в
конечный JS, например:

#{+= self.example()}

```jade-like
- namespace demo
- placeholder index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{placeholder index(name = 'world')}
	Hello {name}!
{/placeholder}
```

#{/}

Превратится в:

```js
```

В остальном механика таких шаблонов полностью идентичная [template](#template).

#{/block}
{/template}
