- namespace docs.ru.api['2::JS API']['1::Общее']['1::compile']

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
* [renderAs](#compile--renderAs)
* [renderMode](#compile--renderMode)
* [doctype](#compile--doctype)

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
Snakeskin.compile(<шаблон>, {
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

Параметр задаёт объект для экспорта свойств при компиляции в стиле commonJS.

```
{template foo()}
	Hello world
{/template}
```

```js
var tpls = {};

Snakeskin.compile(<шаблон>, {
	context: tpls
});

tpls.foo() // Hello world
```

#### debug

```js
\/**
 * @type {Object=}
 */
```

Объект, который будет содержать в себе некоторую отладочную информацию.

```js
var info = {};
Snakeskin.compile(<шаблон>, {debug: info});
info.code // Исходный текст полученного JS файла
```

#### throws

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то в случае ошибки и отсутствия обработчика ошибок - будет возбуждено исключение.

По умолчанию просто выводится сообщение в `stderr` и прерывается операция.

#### i18nFn

```js
\/**
 * @type {?string=}
 * @default 'i18n'
 */
```

Название используемой функции локализации: данная функция будет оборачивать строки локализации.

#### localization

```js
\/**
 * @type {?boolean=}
 * @default true
 */
```

Если параметр равен `false`, то строки вида `` ` ... ` `` не будут дополнительно обрабатываться.

#### language

```js
\/**
 * @type {Object=}
 */
```

Если задан данный параметр, то строки локализации будут заменятся на этапе трансляции.

```
{template foo()}
	`Hello world`
{/template}
```

```js
Snakeskin.compile(<шаблон>, {
	'Hello world': 'Привет мир'
});
```

#### words

```js
\/**
 * @type {Object=}
 */
```

Если задан данный параметр, то найденные в шаблонах строки локализации будут добавляться в него в виде свойств.

```
{template foo()}
	`Hello world`
{/template}
```

```js
var words = {};

Snakeskin.compile(<шаблон>, {
	words: words
});

words // {'Hello word': 'Hello word'}
```

#### module

```js
\/**
 * @type {?string=}
 * @default 'default'
 */
```

Параметр задаёт тип экспорта шаблонов.

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
* `stringBuffer` - шаблон генерируется в виде строки, для конкатенаций используется оператор [StringBuffer](https://github.com/kobezzza/Snakeskin/blob/master/lib/live.es6#L12);
* `dom` - шаблон генерируется в виде [DocumentFragment](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment) с помощью DOM API.

#### eol

```js
\/**
 * @type {?string=}
 * @default '\n'
 */
```

Параметр задаёт символ перевода строки, который будет использоваться в сгенерированном файле, можно использовать `\n`, `\r` или `\r\n`.

#### tolerateWhitespaces

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то пробельные символы в шаблоне обрабатываются «как есть».

#### ignore

```js
\/**
 * @type {RegExp=}
 */
```

Параметр задаёт пробельные символы, которые будут игнорироваться в шаблонах.

#### doctype

```js
\/**
 * @type {(string|boolean|null)=}
 * @default 'xml'
 */
```

Параметр задаёт тип XML документа: это влияет на код, который генерируют некоторые директивы, например, [tag](https://github.com/kobezzza/Snakeskin/wiki/tag), а также может включать различные дополнительные проверки на уровне исходного кода.

Доступны варианты:

1. `xml` - дополнительные проверки шаблона, разметка в стиле xml;
2. `html` - дополнительные проверки шаблона, разметка в стиле html;
3. `false` - нет дополнительных проверок, разметка в стиле html.

#### onError

```js
\/**
 * @type {?function(!Error)=}
 */
```

Параметр задаёт функцию обратного вызова для обработки ошибок.


#### useStrict

```js
\/**
 * @type {?boolean=}
 * @default true
 */
```

Если параметр равен `false`, то шаблоны компилируются без `'use strict';`.

#### bemFilter

```js
\/**
 * @type {?string=}
 * @default 'bem'
 */
```

Параметр задаёт название фильтра для БЭМ.

#### prettyPrint

```js
\/**
 * @type {?boolean=}
 * @default false
 */
```

Если параметр равен `true`, то полученный JS после трансляции будет отформатирован.

#### file

```js
\/**
 * @type {?string=}
 */
```

Параметр задаёт адрес компилируемого файла.

#{/block}
{/template}
