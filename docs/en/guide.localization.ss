- namespace docs.en.guide['2::Основы']['6::Локализация']

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

В Snakeskin существует специальный тип строк `` ` ... ` ``, которые при параметре
[localization](api#{@@prfx}.html#compile--localization) (включён по умолчанию) будут автоматически оборачиваться функцией `i18n()`.

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

Данные строки можно также использовать внутри директив, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{`Hello world!`}
```

```classic
{namespace demo}
{template index()}
	{`Hello world!`}
{/template}
```

#{/}

Имя используемой функции локализации можно задать явно с помощью параметра [i18nFn](api#{@@prfx}.html#compile--i18nFn).

## Передача параметров функции локализации

Snakeskin поддерживает передачу параметров для функции локализации, которые задаются в виде строки через параметр
[i18nFnOptions](api#{@@prfx}.html#compile--i18nFnOptions), например:

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
	i18nFnOptions: '{lang: "en"}, true'
});
```

Строка локализации скомпилируется как

```js
i18n("hello world!", {lang: "en"}, true)
```

### Локальная передача параметров

Если строка локализации находится внутри директивы, то можно явно передать дополнительные параметры, которые будут
заменять глобальные, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{`Привет мир!`({lang: "ru"}, true)}
```

```classic
{namespace demo}
{template index()}
	{`Привет мир!`({lang: "ru"}, true)}
{/template}
```

#{/}

## Экранирование

Чтобы использовать символ `` ` `` самостоятельно, то его нужно экранировать.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	\\`Hello world!\\`
```

```classic
{namespace demo}
{template index()}
	\\`Hello world!\\`
{/template}
```

#{/}

Отрендерится как:

```html
`Hello world!`
```

Или же можно просто отключить параметр [localization](api#{@@prfx}.html#compile--localization).

## Замена на этапе трансляции

Если при компиляции шаблонов задать параметр-объект `language`, то найденные литералы будут автоматически заменятся
на указанные в объекте.

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
	language: {
		// В качестве значений замены можно также использовать функции,
		// которые возвращают строку
		'Hello world!': 'Привет мир!'
	}
});
```

Отрендерится как:

```html
Привет мир!
```

Т.к. смежные пробельные символы в Snakeskin схлопываются один, то следующий пример также будет работать.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	`Hello


	world!`
```

```classic
{namespace demo}
{template index()}
	`Hello


	world!`
{/template}
```

#{/}

```js
Snakeskin.compile('<шаблон>', {
	language: {
		'Hello world!': 'Привет мир!'
	}
});
```

## Генерация таблицы используемых литералов

Дополнительно Snakeskin может сохранить все найденные литералы локализации в объект, чтобы потом,
например, можно было передать его переводчикам. За эту функцию отвечает параметр [words](api#{@@prfx}.html#compile--words).

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

#{/block}
{/template}
