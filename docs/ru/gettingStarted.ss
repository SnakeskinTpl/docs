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

### Песочница

Простейшим способом изучения возможностей Snakeskin является использование [онлайн-песочницы](http://codepen.io/kobezzza/pen/zrJNXx)
на Codepen.

### Использование Snakeskin как серверного шаблонизатора вместе с Node.js

Snakeskin содержит ряд вспомогательных методов для удобной работы из Node.js.

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

### Использование вместе с Vue и Webpack

Snakeskin бесшовно интегрируется с большинством популярных MVVM библиотек и фреймворков, а
использование SS вместе с Webpack является одной из самых лучших практик.

**webpack.config.js**

```js
var webpack = require('webpack');

webpack({
	entry: {
		index: './button.js'
	},

	output: {
		filename: '[name].bundle.js'
	},

	module: {
		loaders: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				loader: 'babel'
			},

			{
				test: /\.ss$/,
				exclude: /node_modules/,
				loader: 'snakeskin-loader?pack=true'
			}
		]
	}
});
```

**button.ss**

#{+= self.example()}

```jade-like
- namespace button
- template index()
	< button.b-button :type = type | :form = form
		{{ label }}
```

```classic
{namespace button}
{template index()}
	{< button.b-button :type = type | :form = form}
		{{ label }}
	{/}
{/template}
```

#{/}

**button.js**

```js
import { button } from './button.ss';

Vue.component('button', {
	props: {
		label: {
			type: String,
			required: true
		},
		type: String,
		form: String
	},

	template: button.index()
});
```

В примере используется JS стандарта ES2015, поэтому также добавлен лоадер для транслятора [Babel](https://babeljs.io/),
чтобы обеспечить поддержку в старых браузерах.

### Статическая генерация страниц вместе с Gulp

Snakeskin может немедленно выполнить скомпилированный шаблон по заданному имени и вернуть результат,
а если имя шаблона не задано, то оно будет вычислено по формуле:

```
шаблон с именем главного файла (без расширения) ||
main ||
index ||
первый шаблон в списке
```

**gulpfile.js**

```js
var
	gulp = require('gulp'),
	ss = require('gulp-snakeskin');

gulp.task('snakeskin', function () {
	gulp.src('index.ss')
		.pipe(ss({exec: true}))
		.pipe(gulp.dest('./dist/index.html'));
});

gulp.task('default', ['snakeskin']);
```

**index.ss**

#{+= self.example()}

```jade-like
- namespace index
- template main()
	< .hello
		Hello world!
```

```classic
{namespace index}
{template main()}
	{< .hello}
		Hello world!
	{/}
{/template}
```

#{/}

Также для задач статической генерации страниц может использоваться Grunt, Webpack или Snakeskin CLI.

### Статическая генерация с Snakeskin CLI

Генерация страницы index.html на основе шаблона index.ss из примера выше.

```bash
snakeskin ./index.ss -e -o ./dist/index.html
```

#{/block}
{/template}
