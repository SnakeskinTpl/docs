- namespace docs.ru.api['Директивы']['10::Работа с пробельными символами']['1::ignoreWhitespaces']

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

Директива **ignoreWhitespaces** декларирует, что все последующие пробельные символы до первого не пробельного
должны игнорироваться.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы         | Интерполяция |
|-------------------------------------------|--------------------|-----------------------|--------------|
| Только внутри шаблонов или внешних блоков | `&`                | Строковая, логическая | Не требуется |

## Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	Hello{&}             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	Hello{&}             World Bar
{/template}
```

#{/}

Отрендерится как:

```html
HelloWorld Bar
```

#{/block}
{/template}
