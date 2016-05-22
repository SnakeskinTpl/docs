- namespace docs.en.api['2::JS API']['1::Общее']['1::compile']

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

Метод компилирует заданный текст шаблона или содержимое DOM узла.

## Интерфейс

```js
Snakeskin.compile(src, opt_params, opt_info) {
	return string || false || null;
}
```

### Аргументы

1. `(!Element|string)` `src` - ссылка на DOM узел, где декларированы шаблоны или исходный текст шаблонов;
2. `Object=` `opt_params` - дополнительные параметры запуска;
3. `Object=` `opt_info` - дополнительная информация для отладчика.

#### opt_params

* [cache](#compile--cache)
* [vars](#compile--vars)
* [context](#compile--context)
* [onError](#compile--onError)
* [throws](#compile--throws)
* [debug](#compile--debug)
* [pack](#compile--pack)
* [module](#compile--module)
* [moduleId](#compile--moduleId)
* [moduleName](#compile--moduleName)
* [useStrict](#compile--useStrict)
* [prettyPrint](#compile--prettyPrint)
* [literalBounds](#compile--literalBounds)
* [bemFilter](#compile--bemFilter)
* [filters](#compile--filters)
* [localization](#compile--localization)
* [i18nFn](#compile--i18nfn)
* [i18nFnOptions](#compile--i18nFnOptions)
* [language](#compile--language)
* [words](#compile--words)
* [ignore](#compile--ignore)
* [tolerateWhitespaces](#compile--tolerateWhitespaces)
* [eol](#compile--eol)
* [doctype](#compile--doctype)
* [renderAs](#compile--renderAs)
* [renderMode](#compile--renderMode)

#### opt_info

* [file](#compile--file)

### Параметры
#### cache

```js
\/**
 * @type {?boolean=}
 * @default true
 */
```

Если параметр равен `false`, то наличие шаблона в кеше не будет проверятся, а сам шаблон не будет кешироваться.

#### vars

```js
\/**
 * @type {Object=}
 */
```

Параметр задаёт [суперглобальные переменные](#global) Snakeskin.

```js
Snakeskin.compile('<шаблон>', {
	vars: {
		foo: 'bar'
	}
});
```

#### context

```js
\/**
 * @type {Object=}
 */
```

Параметр задаёт объект для экспорта свойств при компиляции в стиле [CommonJS](http://www.commonjs.org).

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	Hello world!
```

```classic
{namespace demo}
{template index()
	Hello world!
{/template}
```

#{/}

```js
var tpls = {};

Snakeskin.compile('<шаблон>', {
	context: tpls
});

tpls.demo.foo() // Hello world
```

#### onError

```js
\/**
 * @type {?function(!Error)=}
 */
```

Параметр задаёт функцию обратного вызова для обработки ошибок.

#### throws

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то в случае ошибки и отсутствия обработчика ошибок - будет возбуждено исключение.

По умолчанию просто выводится сообщение в `stderr` и прерывается операция.

#### debug

```js
\/**
 * @type {Object=}
 */
```

Объект, который будет содержать в себе некоторую отладочную информацию.

```js
var info = {};
Snakeskin.compile('<шаблон>', {debug: info});
info.code // Исходный текст полученного JS файла
```

#### pack

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то модель импорта/экспорта модулей будет оптимизирована для использования вместе с [WebPack](http://webpack.github.io).

#### module

```js
\/**
 * @type {?string=}
 * @default 'umd'
 */
```

Тип импорта/экспорта модулей, доступны варианты:

* [umd](https://github.com/umdjs/umd);
* `global` (сохранение напрямую в глобальный объект);
* [cjs](http://www.commonjs.org);
* [amd](http://requirejs.org/docs/whyamd.html#amd);
* [native](http://www.2ality.com/2014/09/es6-modules-final.html).

#### moduleId

```js
\/**
 * @type {?string=}
 * @default 'tpls'
 */
```

ИД модуля для `umd`/`amd` декларации: первый параметр функции [define](http://requirejs.org/docs/whyamd.html#namedmodules).

#### moduleName

```js
\/**
 * @type {?string=}
 */
```

Название модуля для `umd`/`global` декларации: если задан, то в глобальном объекте (`window` и т.д.) будет создано свойство
с указанным именем, куда будут сохраняться полученные шаблоны, иначе, всё будет сохранено напрямую в глобальный объект.

#### useStrict

```js
\/**
 * @type {?boolean=}
 * @default true
 */
```

Если параметр равен `false`, то шаблоны компилируются без `'use strict';`.

#### prettyPrint

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то полученный JS после трансляции будет отформатирован.

#### literalBounds

```js
\/**
 * @type {Array<string>=}
 * @default ['{{', '}}']
 */
```

Параметр задаёт "врапперы" для директивы [literal](#literal), например:

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

#### bemFilter

```js
\/**
 * @type {?string=}
 * @default 'bem'
 */
```

Параметр задаёт название [фильтра](#{@@guide}#filters) для обработки [липких ссылок](#tag--Ссылки_на_родительский_класс),
по умолчанию используется `Snakeskin.Filters.bem`.

#### filters

```js
\/**
 * @type {Object<Array<string>>=}
 * @default {global: ['html', 'undef'], local: ['undef']}
 */
```

Объект [фильтров](#{@@guide}#filters) по умолчанию для директивы [output](#output):
фильтры бывают 2-х видов - глобальные (применяются ко всему полученному выражению, ключ `global`) и
локальные (применяются к каждой части выражения по отдельности, ключ `local`).

#### localization

```js
\/**
 * @type {?boolean=}
 * @default true
 */
```

Если параметр равен `false`, то [строки локализации](#{@@guide}#localization) будут отключены, т.е. сохраняются "как есть".

#### i18nFn

```js
\/**
 * @type {?string=}
 * @default 'i18n'
 */
```

Название используемой глобальной функции локализации: данная функция будет оборачивать [строки локализации](#{@@guide}#localization).

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	`Hello world!`
```

```classic
{namespace demo}
{template index()}
	`Hello world!`
{/template}
```

#{/}

Строка `` `Hello world!` `` скомпилируется как

```js
i18n("hello world!")
```

#### i18nFnOptions

```js
\/**
 * @type {?string=}
 */
```

Передаваемые параметры для [глобальной функции локализации](#compile--i18nFn) в строковом виде, например, `'{lang: "en"}, true'`.

#### language

```js
\/**
 * @type {Object=}
 */
```

Если задан данный параметр, то [строки локализации](#{@@guide}#localization) будут заменятся на этапе трансляции.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	`Hello world!`
```

```classic
{namespace demo}
{template index()}
	`Hello world!`
{/template}
```

#{/}

```js
Snakeskin.compile('<шаблон>', {
	'Hello world!': 'Привет мир!'
});
```

#### words

```js
\/**
 * @type {Object=}
 */
```

Если задан данный параметр, то найденные в шаблонах [строки локализации](#{@@guide}#localization) будут добавляться
в него в виде свойств.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	`Hello world!`
```

```classic
{namespace demo}
{template index()}
	`Hello world!`
{/template}
```

#{/}

```js
var words = {};

Snakeskin.compile('<шаблон>', {
	words: words
});

// {'Hello world!': 'Hello world!'}
console.log(words);
```

#### ignore

```js
\/**
 * @type {RegExp=}
 */
```

Параметр задаёт пробельные символы, которые будут игнорироваться в шаблонах.

#### tolerateWhitespaces

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то все пробельные символы в шаблоне обрабатываются "как есть".

#### eol

```js
\/**
 * @type {?string=}
 * @default '\n'
 */
```

Параметр задаёт символ перевода строки, который будет использоваться в сгенерированном файле, можно использовать `\n`, `\r` или `\r\n`.

#### doctype

```js
\/**
 * @type {?string=}
 * @default 'html'
 */
```

Параметр задаёт тип документа: это влияет на код, который генерируют некоторые директивы, например, [tag](#tag).
[Доступные варианты](#doctype--Таблица_обозначений).

#### renderAs

```js
\/**
 * @type {?string=}
 */
```

Параметр задаёт тип шаблонов для рендеринга, доступны варианты:

* `interface` - все директивы [template](#template) рендерятся как [interface](#interface);
* `placeholder` - все директивы *template* и *interface* рендерятся [placeholder](#placeholder).

#### renderMode

```js
\/**
 * @type {?string=}
 * @default 'stringConcat'
 */
```

Параметр задаёт режим рендеринга шаблонов, доступны варианты:

* `stringConcat` - шаблон генерируется в виде строки, для конкатенаций используется оператор `+`;
* `stringBuffer` - шаблон генерируется в виде строки, для конкатенаций используется оператор
[StringBuffer](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/live.js#L26);
* `dom` - шаблон генерируется в виде [DocumentFragment](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment)
с помощью DOM API.

#### file

```js
\/**
 * @type {?string=}
 */
```

Параметр задаёт адрес компилируемого файла.

#{/block}
{/template}
