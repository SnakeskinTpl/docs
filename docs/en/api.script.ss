- namespace docs.en.api['1::Directives']['11::Working with HTML/XML']['4::script']

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

Директива вставляет в шаблон код декларации тега `<script>` с заданными параметрами.

## Synopsis

| Declaration                                | Shorthand | Directive type      | Interpolation   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Only within templates or external blocks | Absent        | Block, text | Supported |

## Description

Директива предназначена для более удобного задания тегов `<script>` и может использоваться только внутри шаблонов или
внешних блоков.

При использовании *script* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{script js src = foo.js}{/}

\/// Короткая форма закрытия
{script js src = foo.js /}
```

### Таблица обозначений
#### js

```
text/javascript
```

#### dart

```
application/dart
```

#### coffee

```
application/coffeescript
```

#### ts

```
application/typescript
```

#### cljs

```
application/clojurescript
```

#### ls

```
application/livescript
```

#### json

```
application/json
```

#### html

```
text/html
```

#### ss

```
text/x-snakeskin-template
```

### Examples
#### Использование значения по умолчанию (js)

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# script
		var a = {};
```

```classic
{namespace demo}
{template index()}
	\#{script}
		var a = {};
	\#{/}
{/template}
```

#{/}

#### Явное указание типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# script ts
		var a = {};
```

```classic
{namespace demo}
{template index()}
	\#{script ts}
		var a = {};
	\#{/}
{/template}
```

#{/}

#### Указание собственного типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# script application/myscript
		var a = {};
```

```classic
{namespace demo}
{template index()}
	\#{script application/myscript}
		var a = {};
	\#{/}
{/template}
```

#{/}

#### Задание произвольных атрибутов

*(используется синтаксис [attr](#attr))*

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# script js class = foo
		var a = {};
```

```classic
{namespace demo}
{template index()}
	\#{script js class = foo}
		var a = {};
	\#{/}
{/template}
```

#{/}

#{/block}
{/template}
