- namespace docs.en.guide['1::Введение']['2::Установка']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

#{template main[%fileName%]() extends base.main}
#{block root}

Snakeskin написан на языке JavaScript и поддерживает работу как в браузере, так и в других окружениях:

* node.js (0.12+);
* node-webkit;
* electron;
* web-worker;
* дополнения к приложениям и т.д..

## Запуск в браузере

* [runtime](https://raw.githubusercontent.com/SnakeskinTpl/Snakeskin/master/dist/snakeskin.live.min.js) -
микробиблиотека для запуска скомпилированных шаблонов;
* [compiler](https://raw.githubusercontent.com/SnakeskinTpl/Snakeskin/master/dist/snakeskin.min.js) - для запуска компилятора
необходимо предварительно установить [ряд зависимостей](https://github.com/SnakeskinTpl/Snakeskin/blob/master/demo/helloworld.html) и
[полифилов](https://github.com/zloirock/core-js) (если нужна поддержка старых браузеров).

## Bower

```bash
bower install --save snakeskin
```

Файлы библиотеки лежат по адресу:

```
bower_components/
	snakeskin/
		dist/
			snakeskin.min.js
			snakeskin.live.min.js
```

## NPM

```bash
npm install --save snakeskin
```

### Плагины

* [Gulp](https://github.com/SnakeskinTpl/gulp-snakeskin)
* [Grunt](https://github.com/SnakeskinTpl/grunt-snakeskin)
* [WebPack](https://github.com/SnakeskinTpl/snakeskin-loader)
* [Browserify](https://github.com/SnakeskinTpl/snakeskinify)
* [CLI](https://github.com/SnakeskinTpl/snakeskin-cli)
* [IntelliJ-IDEA](https://github.com/SnakeskinTpl/IntelliJ-IDEA)
* [Atom](https://github.com/SnakeskinTpl/atom-snakeskin)

### std.ss

[std.ss](https://github.com/SnakeskinTpl/std.ss) - это библиотека написанная на Snakeskin, которая предоставляет ряд
дополнительных функций для разработки.

## GitHub

```bash
git clone https://github.com/SnakeskinTpl/Snakeskin
```


#{/block}
#{/template}
