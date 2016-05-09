- namespace docs.ru.api['Директивы']['11::Работа с HTML/XML']['5::style']

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

Директива вставляет в шаблон код декларации тега `<style>` с заданными параметрами.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы      | Интерполяция   |
|-------------------------------------------|--------------------|--------------------|----------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Блочная, текстовая | Поддерживается |

## Описание

Директива предназначена для более удобного задания тегов `<style>` и может использоваться только внутри шаблонов или
внешних блоков.

### Таблица обозначений
#### css

```
text/css
```

### Примеры
#### Использование значения по умолчанию (css)

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#### Явное указание типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style css
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style css}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#### Указание собственного типа

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# style text/stylus
		.foo
			color red
```

```classic
{namespace demo}
{template index()}
	\#{style text/stylus}
		.foo
			color red
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
	# style css class = foo
		.foo {
			color: red;
		}
```

```classic
{namespace demo}
{template index()}
	\#{style css class = foo}
		.foo {
			color: red;
		}
	\#{/}
{/template}
```

#{/}

#{/block}
{/template}
