- namespace docs.ru.api['1::Директивы']['11::Работа с HTML/XML']['2::attr']

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

Директива вставляет в шаблон код декларации HTML/XML атрибута по заданным параметрам.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы        | Интерполяция   |
|-------------------------------------------|--------------------|----------------------|----------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Строковая, текстовая | Поддерживается |

## Описание

Директива *attr* обычно используется для задания атрибутов вместе с директивой [tag](#tag).
Общая форма директивы следующая:

```js
attr название атрибута = значение атрибута
```

Например:

#{+= self.example()}

```jade-like
- attr foo = bar
```

```classic
{attr foo = bar}
```

#{/}

Обратите внимание, что крайние пробелы у символа `=` важны, иначе он трактуется как простой текст.
Директива может использоваться только внутри шаблонов или внешних блоков.

### Множественное задание атрибутов

Если необходимо задать несколько атрибутов, то нужно использовать специальный разделитель `|`, например:

#{+= self.example()}

```jade-like
- attr foo = bar | baz = bla
```

```classic
{attr foo = bar | baz = bla}
```

#{/}

Обратите внимание, что крайние пробелы у символа `|` важны, иначе он трактуется как простой текст.

#{+= self.example()}

```jade-like
/// foo="bar|baz=bla"
- attr foo = bar|baz=bla
```

```classic
/// foo="bar|baz=bla"
{attr foo = bar|baz=bla}
```

#{/}

### Атрибуты с пустым значением

Если нужно задать атрибут с пустым значением, то достаточно просто ничего не писать после знака присвоения, например:

#{+= self.example()}

```jade-like
- attr alt =
```

```classic
{attr alt =}
```

#{/}

Отрендерится как:

```html
alt=""
```

### Инлайновые атрибуты

Для задания "инлайновых" HTML атрибутов, например, `<input disabled>` нужно просто опустить знак присвоения.

#{+= self.example()}

```jade-like
- attr disabled
```

```classic
{attr disabled}
```

#{/}

### Задание `data-` атрибутов

Для декларации `data-` атрибутов поддерживается короткий синтаксис:

#{+= self.example()}

```jade-like
- attr -title = bla | -desc-field = bar
```

```classic
{attr -title = bla | -desc-field = bar}
```

#{/}

Однако можно писать и полную форму:

#{+= self.example()}

```jade-like
- attr data-title = bla
```

```classic
{attr data-title = bla}
```

#{/}

### Группы атрибутов

В Snakeskin есть универсальный синтаксис для создания групп атрибутов с автоматическим добавлением указанного префикса,
общая форма следующая:

```js
attr опциональный префикс(( название атрибута = значение атрибута ))
```

Например:

#{+= self.example()}

```jade-like
- attr ng-(( repeat = el in data | bind = bla ))
```

```classic
{attr ng-(( repeat = el in data | bind = bla ))}
```

#{/}

Отрендерится как:

```html
ng-repeat="el in data" ng-bind="bla"
```

Обратите внимание, что крайние пробелы у символов `((` и `))` важны, иначе они трактуется как простой текст. Также
следует отметить, что при комбинировании групп атрибутов с другими группами не нужно ставить специальный разделитель,
например:

#{+= self.example()}

```jade-like
- attr ng-(( repeat = foo of bla )) (( baz = bar )) hello = world | foo = bar
```

```classic
{attr ng-(( repeat = foo of bla )) (( baz = bar )) hello = world | foo = bar}
```

#{/}

### Интерполяция

Для передачи значений Snakeskin внутрь директивы используется [стандартный механизм интерполяции](guide#{@@prfx}.html#basics--Интерполяция),
например:

#{+= self.example()}

```jade-like
- var name = 'foo'
- attr ${name} = ${1 + 2}
```

```classic
{var name = 'foo' /}
{attr ${name} = ${1 + 2}}
```

#{/}

Допускается смешивать интерполяцию с обычной декларацией:

#{+= self.example()}

```jade-like
- var name = 'foo'
- attr ${name}-bar = ${1 + 2} hello
```

```classic
{var name = 'foo' /}
{attr ${name}-bar = ${1 + 2} hello}
```

#{/}

#### Интерполяция объекта

Snakeskin позволяет используя механизм интерполяции задать атрибуты с помощью объекта, где ключом является название атрибута или группы.

#{+= self.example()}

```jade-like
- var attrs = {foo: 'bar', 'ng-': {repeat: 'el in data'}}
- attr ${attrs}
```

```classic
{var attrs = {foo: 'bar', 'ng-': {repeat: 'el in data'}} /}
{attr ${attrs}}
```

#{/}

Чтобы сделать атрибут "инлайновым" нужно использовать специальную константу **TRUE**:

#{+= self.example()}

```jade-like
- var attrs = {disabled: TRUE}
- attr ${attrs}
```

```classic
{var attrs = {disabled: TRUE} /}
{attr ${attrs}}
```

#{/}

Отрендерится как:

```html
disabled
```

А чтобы исключить, то нужно использовать константу `FALSE`:

#{+= self.example()}

```jade-like
- var attrs = {disabled: FALSE}
- attr ${attrs}
```

```classic
{var attrs = {disabled: FALSE} /}
{attr ${attrs}}
```

#{/}

Значение ключа автоматически переводится из camelCase в dash-style, например:

#{+= self.example()}

```jade-like
- attr ${{fooBarBla: 'baz'}}
```

```classic
{attr ${{fooBarBla: 'baz'}}}
```

#{/}

Отрендерится как:

```html
foo-bar-bla="baz"
```

### Экранирование

Для экранирования спецсимволов директивы используется символ `\\`, например:

#{+= self.example()}

```jade-like
- attr foo = bar \\= bla
```

```classic
{attr foo = bar \\= bla}
```

#{/}

#{/block}
{/template}
