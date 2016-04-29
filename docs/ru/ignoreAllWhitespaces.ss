- namespace docs.ru.api['Директивы']['9::Работа с пробельными символами']['2::ignoreAllWhitespaces']

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

Директива **ignoreAllWhitespaces** декларирует, что все вложенные в директиву пробельные символы должны игнорироваться.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы       | Интерполяция |
|-------------------------------------------|--------------------|---------------------|--------------|
| Только внутри шаблонов или внешних блоков | `&+`               | Блочная, логическая | Не требуется |

## Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	&+
		Hello             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	{&+}
		Hello             World Bar
	{/}
{/template}
```

#{/}

Отрендерится как:

```html
HelloWorldBar
```

#{/block}
{/template}
