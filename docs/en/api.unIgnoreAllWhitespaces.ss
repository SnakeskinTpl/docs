- namespace docs.en.api['1::Directives']['10::Работа с пробельными символами']['3::unIgnoreAllWhitespaces']

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

Директива декларирует, что все вложенные в директиву пробельные символы не должны игнорироваться
(обычно используется вместе с [ignoreAllWhitespaces](#ignoreAllWhitespaces)).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы       | Интерполяция |
|-------------------------------------------|--------------------|---------------------|--------------|
| Только внутри шаблонов или внешних блоков | `&-`               | Блочная, логическая | Не требуется |

## Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	&+
		Hello             World Bar
		&-
			Hello             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	{&+}
		Hello             World Bar
		{&-}
			Hello             World Bar
		{/}
	{/}
{/template}
```

#{/}

Отрендерится как:

```html
HelloWorldBarHello World Bar
```

#{/block}
{/template}
