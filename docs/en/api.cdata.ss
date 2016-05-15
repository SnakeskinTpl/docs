- namespace docs.en.api['1::Directives']['12::Экранирование']['1::cdata']

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

Директива задаёт блок текста, который вырезается до трансляции, а затем вставляется без изменений в
результирующую функцию (пробельные символы также остаются неизменны).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы      | Интерполяция      |
|-------------------------------------------|--------------------|--------------------|-------------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Блочная, текстовая | Не поддерживается |

## Описание

Директива используется для экранирования больших фрагментов текста, которые должны вставляться "как есть".
Декларация директивы возможно только с помощью [расширенного синтаксиса](guide#{@@prfx}.html#basics--Расширенный_синтаксис).
Закрывающий [end](#end) может быть либо `\#{end cdata}`, либо `\#{/cdata}`.
Директива может использоваться только внутри шаблонов или внешних блоков.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	#\{cdata}
		- if true
			Hello world!
	#\{/cdata}
```

```classic
{namespace demo}
{template index()}
	#\{cdata}
		{if true}
			Hello world!
		{/}
	#\{/cdata}
{/template}
```

#{/}

#{/block}
{/template}
