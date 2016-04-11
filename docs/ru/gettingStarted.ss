- namespace docs.ru.guide['1::Введение']['3::Концепт и варианты применения']

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

## Общая концепция

Шаблоны в Snakeskin - это функции в JavaScript.

#{+= self.example()}

```jade-like
- namespace demo
- template helloWorld(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template helloWorld(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Эквивалентно

```js
if (exports.demo === 'undefined') {
	var demo = exports.demo = {};
}

exports.demo.helloWorld = function helloWorld(name) {
	return 'Hello ' + escape(name) + '!';
}
```

После компиляции вызов шаблона соответствует простому вызову функции.
Такой же подход используется в [Google Closure Templates](https://developers.google.com/closure/templates/).

## Песочница

Простейшим способом изучения возможностей Snakeskin является использование [онлайн-песочницы](http://codepen.io/kobezzza/pen/zrJNXx)
на Codepen.

## Способы использования и основные use-case

Snakeskin поддерживает работу как на клиенте, так и на сервере, а также интеграцию со всеми основными системами сборок:

* [gulp](https://github.com/SnakeskinTpl/gulp-snakeskin)
* [grunt](https://github.com/SnakeskinTpl/grunt-snakeskin)
* [webpack](https://github.com/SnakeskinTpl/snakeskin-loader)

Основные use-case Snakeskin - это:

1. Серверная шаблонизация;
2. Предварительная трансляция шаблонов в JS и использование их на клиенте;
3. Генерация шаблонов для различных фреймворков, например, Angular, Vue, React и т.д.;
4. Статическая генерация страниц на этапе сборки проекта.

Также есть возможность "живой" компиляции в браузере, хотя данная фича не рекомендуется для prod.

### Использование Snakeskin как серверного шаблонизатора вместе с Node.js

**templates.ss**

#{+= self.example()}

```jade-like
- namespace registration
- template index()
	< input name = login | type = text | placeholder = Логин
	< input name = password | type = password | placeholder = Пароль
```

```classic
{namespace registration}
{template index()}
	{< input name = login | type = text | placeholder = Логин}{/}
	{< input name = password | type = password | placeholder = Пароль}{/}
{/template}
```

#{/}

**index.js**

```js
var ss = require('snakeskin');

console.log(
	ss.compileFile('templates.ss').registration.index()
);
```

### Подключение уже скомпилированного шаблона в Node.js

Скомпилированные файлы Snakeskin подключаются как простые Node.js модули.

**index.js**

```js
var tpls = require('./templates.ss.js');
```

### Использование в браузере вместе с Webpack

**webpack.config.js**

```js
var webpack = require('webpack');

webpack({
	entry: {
			index: './index.js'
	},

	output: {
			filename: '[name].bundle.js'
	},

	module: {
		loaders: [
			{
				test: /\.ss$/,
				exclude: /node_modules/,
				loader: 'snakeskin-loader?pack=true'
			}
		]
	}
});
```

**templates.ss**

#{+= self.example()}

```jade-like
- namespace registration
- template index()
	< input name = login | type = text | placeholder = Логин
	< input name = password | type = password | placeholder = Пароль
```

```classic
{namespace registration}
{template index()}
	{< input name = login | type = text | placeholder = Логин}{/}
	{< input name = password | type = password | placeholder = Пароль}{/}
{/template}
```

#{/}

**index.js**

```js
var tpls = require('templates.ss');

console.log(
	tpls.registration.index()
);
```

### Статическая генерация страниц вместе с Gulp

**gulpfile.js**

```js
var
	gulp = require('gulp'),
	ss = require('gulp-snakeskin');

gulp.task('snakeskin', function () {
	gulp.src('templates.ss')
		.pipe(ss({exec: true, tpl: 'registration'}))
		.pipe(gulp.dest('./dist/registration.html'));
});

gulp.task('default', ['snakeskin']);
```

**templates.ss**

#{+= self.example()}

```jade-like
- namespace registration
- template index()
	< input name = login | type = text | placeholder = Логин
	< input name = password | type = password | placeholder = Пароль
```

```classic
{namespace registration}
{template index()}
	{< input name = login | type = text | placeholder = Логин}{/}
	{< input name = password | type = password | placeholder = Пароль}{/}
{/template}
```

#{/}

### Статическая генерация с CLI

Генерация страницы index.html на основе шаблона templates.ss и данных myData.json.

```bash
snakeskin templates.ss -e -d myData.json -o index.html
```

Если шаблон для запуска не задан явно, то он определяется по правилу:

```
шаблон с именем текущего файла (без расширения) ||
main ||
index ||
первый шаблон в списке
```

#{/block}
{/template}
