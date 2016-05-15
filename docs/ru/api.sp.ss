- namespace docs.ru.api['1::Директивы']['10::Работа с пробельными символами']['4::sp']

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

Директива вставляет в шаблон пробельный символ (актуально только для Jade-Like).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы        | Интерполяция |
|-------------------------------------------|--------------------|----------------------|--------------|
| Только внутри шаблонов или внешних блоков | `\\`               | Строковая, текстовая | Не требуется |

## Примеры

```jade-like
- namespace demo
- template index(value, area)
	< .foo
	\
	< .bar
```

Отрендерится как:

```html
<div class="foo"></div> <div class="bar"></div>
```

#{/block}
{/template}
