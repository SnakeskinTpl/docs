- namespace docs.en.api['1::Directives']['11::Working with HTML/XML']['6::link']

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

Директива вставляет в шаблон код декларации тега `<link>` с заданными параметрами.

## Synopsis

| Declaration                                | Shorthand | Directive type      | Interpolation   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Only within templates or external blocks | Absent        | Block, text | Supported |

## Description

Директива предназначена для более удобного задания тегов `<link>` и может использоваться только внутри шаблонов или
внешних блоков.

При использовании *link* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{link css href = foo.css}{/}

\/// Короткая форма закрытия
{link css href = foo.css /}
```

### Таблица обозначений
#### css

```
type="text/css" rel="stylesheet"
```

#### acss

```
type="text/css" rel="alternate stylesheet"
```

#### icon

```
type="image/x-icon" rel="icon"
```

### Examples
#### Использование значения по умолчанию css

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- link
		http://bar.com/foo.css
```

```classic
{namespace demo}
{template index()}
	{link}http://bar.com/foo.css{/}
{/template}
```

#{/}

#### Явное указание типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- link acss
		http://bar.com/foo.css
```

```classic
{namespace demo}
{template index()}
	{link acss}http://bar.com/foo.css{/}
{/template}
```

#{/}

#### Указание собственного типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- link (( type = text/stylus | rel = stylesheet ))
		http://bar.com/foo.styl
```

```classic
{namespace demo}
{template index()}
	{link (( type = text/stylus | rel = stylesheet ))}http://bar.com/foo.styl{/}
{/template}
```

#{/}

#### Задание произвольных атрибутов

*(используется синтаксис [attr](#attr))*

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- link css rel = alternate stylesheet
		http://bar.com/foo.css
```

```classic
{namespace demo}
{template index()}
	{link css rel = alternate stylesheet}http://bar.com/foo.css{/}
{/template}
```

#{/}

#{/block}
{/template}
