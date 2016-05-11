- namespace docs.ru.api['1::Директивы']['11::Работа с HTML/XML']['1::doctype']

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

Директива вставляет в шаблон код декларации заданного [doctype](http://htmlbook.ru/html/!doctype),
а также определяет правила форматирования для тегов и атрибутов.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы        | Интерполяция      |
|-------------------------------------------|--------------------|----------------------|-------------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Строковая, текстовая | Не поддерживается |

## Описание

Директива предназначена для указания типа текущего документа - DTD (document type definition, описание типа документа).
Это необходимо, чтобы клиент/парсер понимал, как следует интерпретировать текущую страницу, а также указывает Snakeskin
какие правила он должен применять при генерации кода тегов и атрибутов.

Директива может использоваться только внутри шаблонов или внешних блоков.

### Таблица обозначений
#### html

```html
<!DOCTYPE html>
```

#### xml

```html
<?xml version="1.0" encoding="utf-8" ?>
```

#### transitional

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```

#### strict

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
```

#### frameset

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
```

#### 1.1

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
```

#### basic

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
```

#### mobile

```html
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.2//EN" "http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd">
```

#### mathml 1.0

```html
<!DOCTYPE math SYSTEM "http://www.w3.org/Math/DTD/mathml1/mathml.dtd">
```

#### mathml 2.0

```html
<!DOCTYPE math PUBLIC "-//W3C//DTD MathML 2.0//EN" "http://www.w3.org/Math/DTD/mathml2/mathml2.dtd">
```

#### svg 1.0

```html
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
```

#### svg 1.1 full

```html
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
```

#### svg 1.1 basic

```html
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1 Basic//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11-basic.dtd">
```

#### svg 1.1 tiny

```html
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1 Tiny//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11-tiny.dtd">
```

### Примеры
#### Использование значения по умолчанию (html5)

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	- doctype
```

```classic
{namespace demo}
{template index(value)}
	{doctype}
{/template}
```

#{/}

#### Явное указание типа

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	- doctype xml
```

```classic
{namespace demo}
{template index(value)}
	{doctype xml}
{/template}
```

#{/}

#{/block}
{/template}
