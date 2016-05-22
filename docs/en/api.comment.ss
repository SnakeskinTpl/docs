- namespace docs.en.api['1::Directives']['11::Working with HTML/XML']['7::comment']

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

Директива вставляет в шаблон код декларации XML комментария с заданными параметрами.

## Synopsis

| Declaration                                | Shorthand | Directive type      | Interpolation   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Only within templates or external blocks | `<!`               | Block, text | Supported |

## Description

Директива предназначена для более удобного задания тегов XML комментариев и может использоваться только внутри шаблонов
или внешних блоков.

### Examples
#### Простое использование

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	<!
		Hello world!
```

```classic
{namespace demo}
{template index()}
	{<!}Hello world!{/}
{/template}
```

#{/}

#### Задание условного комментария

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	<! IE 7
		Hello world!
```

```classic
{namespace demo}
{template index()}
	{<! IE 7}Hello world!{/}
{/template}
```

#{/}

Отрендерится как:

```
<!--[if IE 7]>Hello world!<![endif]-->
```

#### Интерполяция

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var ie = 7
	<! IE ${ie}
		Hello world!
```

```classic
{namespace demo}
{template index()}
	{var ie = 7 /}
	{<! IE ${ie}}Hello world!{/}
{/template}
```

#{/}

#{/block}
{/template}
