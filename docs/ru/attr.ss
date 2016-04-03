- namespace docs.ru.api['Директивы']['Работа с HTML/XML']['2::attr']

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

Директива **attr** вставляет код декларации HTML/XML атрибута по заданным параметрам.

## Паспорт

| Декларация                                | Короткий синтаксис | Тип директивы |
|-------------------------------------------|--------------------|---------------|
| Только внутри шаблонов или внешних блоков | Отсутствует        | Строковая     |

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

### Множестевнное задание атрибутов

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

### Инлайновые атрибуты

Для задания "инлайновых" HTML атрибутов, например, `<input disabled>` нужно просто опустить символ `=`.

#{+= self.example()}

```jade-like
- attr disabled
```

```classic
{attr disabled}
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

### Задание `data-` атрибутов

Для декларации `data-` атрибутов поддеживается короткий синтаксис:

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
общая форма директивы следующая:

```js
attr опциональный префикс(( название атрибута = значение атрибута ))
```

Например:

#{+= self.example()}

```jade-like
- attr ng-(( repeat = el in data | bind = bla ))
```

```classic
{attr dng-(( repeat = el in data | bind = bla ))}
```

#{/}

Обратите внимание, что крайние пробелы у символов `((` и `))` важны, иначе они трактуется как простой текст. Также
следует отметить, что при комбинировании групп атрибутов с другими группами атрибутов не нужно ставить специальный разделитель,
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

Директива поддерживает механизм интерполяции значений, т.е. есть возможность пробрасывать вычисляемые значения внутрь декларации и
для этого используется специальный синтаксис `${выражение}`.

#{+= self.example()}

```jade-like
- var name = 'foo'
- attr ${name} = ${1 + 2}
```

```classic
{var name = 'foo'}
{attr ${name} = ${1 + 2}}
```

#{/}

Допускается смешивать интепроляцию с обычной декларацией:

#{+= self.example()}

```jade-like
- var name = 'foo'
- attr ${name}-bar = ${1 + 2} hello
```

```classic
{var name = 'foo'}
{attr ${name}-bar = ${1 + 2} hello}
```

#{/}

#### Интеполяция объекта

Snakeskin позволяет используя механизм интерполяции задать атрибуты с помощью обьекта, где ключём является название атрибута или группы.

#{+= self.example()}

```jade-like
- var attrs = {foo: 'bar', 'ng-': {repeat: 'el in data'}}
- attr ${attrs}
```

```classic
{var attrs = {foo: 'bar', 'ng-': {repeat: 'el in data'}}}
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
{var attrs = {disabled: TRUE}}
{attr ${attrs}}
```

#{/}

А чтобы исключить, то нужно использовать константу `FALSE`:

#{+= self.example()}

```jade-like
- var attrs = {disabled: FALSE}
- attr ${attrs}
```

```classic
{var attrs = {disabled: FALSE}}
{attr ${attrs}}
```

#{/}

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
