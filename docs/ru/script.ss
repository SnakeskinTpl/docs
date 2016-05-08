- namespace docs.ru.api['Директивы']['11::Работа с HTML/XML']['4::script']

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

Директива **script** вставляет в шаблон код декларации тега `<script>` с заданными параметрами.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы      | Интерполяция   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Блочная, текстовая | Поддерживается |

## Описание

Директива предназначена для более удобного задания тегов `<script>` и может использоваться только внутри шаблонов или
внешних блоков.

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

### Примеры
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
