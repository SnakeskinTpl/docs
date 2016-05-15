- namespace docs.ru.api['1::Директивы']['12::Экранирование']['2::literal']

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

Директива задаёт блок текста, который вставляется без изменений в результирующую функцию, а также
будет врапиться специальными текстовыми символами согласно параметру [literalBounds](#compile--literalBounds).

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы        | Интерполяция   |
|-------------------------------------------|--------------------|----------------------|----------------|
| Только внутри шаблонов или внешних блоков | Не требуется       | Строковая, текстовая | Поддерживается |

## Описание

Директива используется для [интеграции шаблонов Snakeskin с другими шаблонами](guide#{@@prfx}.html#introLiteral).
Директива может использоваться только внутри шаблонов или внешних блоков.

### Примеры
#### Простое использование

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{{ Hello }}
```

```classic
{namespace demo}
{template index()
	{{ Hello }}
{/template}
```

#{/}

Отрендерится как:

```html
{{ Hello }}
```

#### Интерполяция

Для передачи значений Snakeskin внутрь директивы используется [стандартный механизм интерполяции](guide#{@@prfx}.html#basics--Интерполяция).

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{{ Hello${1 + 2} }}
```

```classic
{namespace demo}
{template index()
	{{ Hello${1 + 2} }}
{/template}
```

#{/}

Отрендерится как:

```html
{{ Hello3 }}
```

#### Задание literalBounds

#{+= self.example()}

```jade-like
- namespace demo
- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{namespace demo}
{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

Отрендерится как:

```html
<?php Hello ?>
```

#{/block}
{/template}
