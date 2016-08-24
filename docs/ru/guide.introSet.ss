- namespace docs.ru.guide['2::Основы']['7::Параметры трансляции']

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

Транслятор Snakeskin поддерживает множество дополнительных режимов работы, которые можно задавать через метод
[compile](#{@@api}#compile) и т.д., но также, Snakeskin позволяет декларировать часть таких параметров непосредственно
в тексте программы, например:

#{+= self.example()}

```jade-like
@= tolerateWhitespaces true
@= literalBounds ['<?php', '?>']
```

```classic
{@= tolerateWhitespaces true}
{@= literalBounds ['<?php', '?>']}
```

#{/}

Задачу параметров трансляции выполняет директива [set](#{@@api}#set), которая имеет короткий синтаксис декларации `@=`.
Поддерживаются следующие параметры:

* [renderMode](#{@@api}#compile--renderMode)
* [renderAs](#{@@api}#compile--renderAs)
* [localization](#{@@api}#compile--localization)
* [i18nFn](#{@@api}#compile--i18nFn)
* [i18nFnOptions](#{@@api}#compile--i18nFnOptions)
* [literalBounds](#{@@api}#compile--literalBounds)
* [tagFilter](#{@@api}#compile--tagFilter)
* [tagNameFilter](#{@@api}#compile--tagNameFilter)
* [attrKeyFilter](#{@@api}#compile--attrKeyFilter)
* [attrValueFilter](#{@@api}#compile--attrValueFilter)
* [bemFilter](#{@@api}#compile--bemFilter)
* [filters](#{@@api}#compile--filters)
* [language](#{@@api}#compile--language)
* [ignore](#{@@api}#compile--ignore)
* [tolerateWhitespaces](#{@@api}#compile--tolerateWhitespaces)
* [doctype](#{@@api}#compile--doctype)

Параметры заданные таким способом распространяются на все шаблоны в файле, а также на все подключаемые файлы, если
они там явно не переопределяются.

## Локальные параметры

Параметр трансляции можно задать локально для конкретного шаблона, причём можно совмещать оба способа декларации,
например:

#{+= self.example()}

```jade-like
@= tolerateWhitespaces true
- namespace demo

- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{@= tolerateWhitespaces true}
{namespace demo}

{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

#{/block}
{/template}
