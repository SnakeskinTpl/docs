- namespace docs.ru.api['Директивы']['1::Создание шаблона']['1::namespace']

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

Директива **namespace** декларирует пространство имён для файла, в котором оно используется, т.е. все декларируемые
в этом файле шаблоны будут частью заданного пространства имён.

## Паспорт

| Декларация                                                   | Короткий синтаксис | Тип директивы         | Интерполяция |
|--------------------------------------------------------------|--------------------|-----------------------|--------------|
| Только в глобальной области, только одна декларация на файл  | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Пространства имён Snakeskin служат для экспорта шаблонов из файла, поэтому перед тем как начать создавать сами шаблоны
нужно предварительно объявить пространство имён, а уже после они будут экспортироваться по схеме `exports.namespace.template`.
В рамках одного файла может быть только одно пространство имён.

Например:

#{+= self.example()}

```jade-like
- namespace demo

\/// Шаблон экспортируется как exports.demo.index
- template index()
	Hello world!
```

```classic
{namespace demo}

\/// Шаблон экспортируется как exports.demo.index
{template index()}
	Hello world!
{/template}
```

#{/}

Пространство имён может состоять из множества частей (свойств объекта), причём Snakeskin проверяет
существование заданного пути и создаёт только те части, которые отсутствуют.

#{+= self.example()}

```jade-like
- namespace demo.helloWorld

\/// exports.demo.helloWorld.index
- template index()
	Hello world!

\/// exports.demo.helloWorld.bar
- template bar()
	Hello people!
```

```classic
{namespace demo.helloWorld}

\/// exports.demo.helloWorld.index
{template index()}
	Hello world!
{/template}

\/// exports.demo.helloWorld.bar
{template bar()}
	Hello people!
{/template}
```

#{/}

Т.к. пространство имён превращается в JS объект, то на используемое имя накладываются те же ограничения,
что и на свойство объекта, однако можно использовать декларацию через квадратные скобки (`[ ... ]`), которая
позволяет использовать любые символы и сложные выражения, например:

#{+= self.example()}

```jade-like
- namespace ['@demo']['hello' + 'World']
\/// exports['@demo']['hello' + 'World'].index
- template index()
	Hello world!
```

```classic
{namespace ['@demo']['hello' + 'World']}
\/// exports['@demo']['hello' + 'World'].index
{template index()}
	Hello world!
{/template}
```

#{/}

Если первая часть имени использует синтаксис без квадратных скобок, то в будет создана глобальная (для Snakeskin)
переменная с таким же именем:

#{+= self.example()}

```jade-like
\/// var demo = exports.demo['helloWorld']
- namespace demo['hello' + 'World']
- template index()
	Hello world!
```

```classic
\/// var demo = exports.demo['helloWorld']
{namespace ['@demo']['hello' + 'World']}
{template index()}
	Hello world!
{/template}
```

#{/}

Пространство имён создаёт [with биндинг](#with), который можно использовать для удобного вызова шаблонов в рамках файла.

#{+= self.example()}

```jade-like
- namespace demo
- template parent()
	Hello world!

\/// Тоже самое, что и extends exports.demo.parent
- template child() extends @parent
```

```classic
{namespace demo}
{template parent()}
	Hello world!
{/template}

\/// Тоже самое, что и extends exports.demo.parent
{template child() extends @parent}
{/template}
```

#{/}

## Плейсхолдеры имени

При декларации пространства имён можно использовать специальные плейсхолдеры, которые заменятся на некоторое
статическое значение в рамках своего контекста.

### %dirName%

Плейсхолдер `%dirName%` заменяется на имя директории, в которой лежит исходный файл Snakeskin, например:

**foo/index.ss**

#{+= self.example()}

```jade-like
- namespace %dirName%.bar

\/// exports.foo.bar.index
- template index()
	Hello world!
```

```classic
{namespace %dirName%.bar}

\/// exports.foo.bar.index
{template index()}
	Hello world!
{/template}
```

#{/}

Т.к. в названии директории могут встречаться "запрещённые" символы, то лучше использовать синтаксис с квадратными скобками:

#{+= self.example()}

```jade-like
- namespace [%dirName%].bar
- template index()
	Hello world!
```

```classic
{namespace [%dirName%].bar}
{template index()}
	Hello world!
{/template}
```

#{/}

### %fileName%

Плейсхолдер `%fileName%` заменяется на имя исходного файла-шаблона (без расширения), например:

**foo/index.ss**

#{+= self.example()}

```jade-like
- namespace %fileName%.bar

\/// exports.index.bar.index
- template index()
	Hello world!
```

```classic
{namespace %fileName%.bar}

\/// exports.index.bar.index
{template index()}
	Hello world!
{/template}
```

#{/}

Т.к. в названии файла могут встречаться "запрещённые" символы, то лучше использовать синтаксис с квадратными скобками:

#{+= self.example()}

```jade-like
- namespace [%fileName%].bar
- template index()
	Hello world!
```

```classic
{namespace [%fileName%].bar}
{template index()}
	Hello world!
{/template}
```

#{/}

#{/block}
{/template}
