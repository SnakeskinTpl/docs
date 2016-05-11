- namespace docs.ru.api['Директивы']['13::Модули']['1::include']

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

Директива включает содержимое заданного файла-шаблона в текущий.

## Паспорт

| Декларация                      | Короткий синтаксис | Тип директивы         | Интерполяция |
|---------------------------------|--------------------|-----------------------|--------------|
| Вне шаблонов или внешних блоков | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Любой Snakeskin файл может включать в себя другие SS файлы, т.е. Snakeskin позволяет разбить код на логические части и
создавать подключаемые библиотеки (подобно [std.ss](https://github.com/SnakeskinTpl/std.ss)) и т.д..
Чтобы подключить другой файл используется специальная директива *include*, которая начинается с одноименного ключевого
слова и должна сопровождаться выражением, где задаётся путь к подключаемому файлу, например:

**math.ss**

#{+= self.example()}

```jade-like
- namespace math
- template calc(a, b)
	{a + b}
```

```classic
{namespace math}
{template calc(a, b)}
	{a + b}
{/template}
```

#{/}

**app.ss**

#{+= self.example()}

```jade-like
- namespace app
- include './math'

- template index()
	\/// При вызове шаблона из другого файла
	\/// нужно обязательно указывать пространство имён
	+= math.calc(1, 2)
```

```classic
{namespace app}
{include './math'}

{template index()}
	\/// При вызове шаблона из другого файла
	\/// нужно обязательно указывать пространство имён
	{+= math.calc(1, 2) /}
{/template}
```

#{/}

Snakeskin контролирует чтобы каждый подключаемый файл включался только один раз, т.е. гарантируется отсутствие дубликатов в конечном коде.

#{+= self.example()}

```jade-like
- namespace app
- include './math'

\/// Этот include игнорируется
- include './math'

- template index()
	+= math.calc(1, 2)
```

```classic
{namespace app}
{include './math'}

\/// Этот include игнорируется
{include './math'}

{template index()}
	{+= math.calc(1, 2) /}
{/template}
```

#{/}

В любом Snakeskin файле каждый объявленный шаблон является публичным (экспортируемым), а все глобальные переменные
будут инкапсулированы в рамках своего файла, т.е. нет явного способа получить значение такой переменной из другого файла,
однако такая возможность есть при наследовании шаблонов.

**base.ss**

#{+= self.example()}

```jade-like
- namespace base
- var foo = 'bar'
```

```classic
{namespace math}
{var foo = 'bar' /}
```

#{/}

**app.ss**

#{+= self.example()}

```jade-like
- namespace app
- include './base'

- template index()
	? console.log(foo) \/// Error: foo is not defined
```

```classic
{namespace app}
{include './base'}

{template index()}
	{? console.log(foo)} \/// Error: foo is not defined
{/template}
```

#{/}

При указании пути можно использовать сложные выражения: вызовы функций, тернарные операторы и т.д.

#{+= self.example()}

```jade-like
- namespace app
- include './' + (@@base ? 'base' : 'default')

- template index()
	...
```

```classic
{namespace app}
{include './' + (@@base ? 'base' : 'default')}

{template index()}
	...
{/template}
```

#{/}

Обратите внимание, что при подключении файла нужно обязательно указывать символы `./` или `../` для конкретизации поиска,
т.к. если этого не сделать, то файл будет искаться в папке *node_modules* (как это делает `require` в node.js), а вот
расширение файла можно не указывать - по умолчанию используется `.ss`.
Директива может использоваться только вне шаблонов или внешних блоков.

### Подключение файлов по маске

При указании пути к файлу можно использовать [glob](https://www.npmjs.com/package/glob)-шаблоны, например, чтобы подключить
сразу множество файлов.

#{+= self.example()}

```jade-like
- namespace app
- include './modules\/**\/*'

- template index()
	...
```

```classic
{namespace app}
{include './modules\/**\/*'}

{template index()}
	...
{/template}
```

#{/}

### Динамическое подключение

Директиву *include* можно вызывать динамически, т.е. оборачивать её директивами типа [if](#if), [forEach](#forEach) и т.д..

#{+= self.example()}

```jade-like
- namespace app

- eval
	- var fs = require('fs')
	- var path = require('path')

	\/// В момент трансляции каждый файл имеет свои переменные
	\/// __dirname и __filename
	- var url = path.join(__dirname, 'test')

	- forEach fs.readdirSync(url) => file
		- if path.extname(file) === '.ss'
			- include path.join(url, file)

- template index()
	...
```

```classic
{namespace app}

{eval}
	{var fs = require('fs') /}
	{var path = require('path') /}

	\/// В момент трансляции каждый файл имеет свои переменные
	\/// __dirname и __filename
	{var url = path.join(__dirname, 'test') /}

	{forEach fs.readdirSync(url) => file}
		{if path.extname(file) === '.ss'}
			{include path.join(url, file)}
		{/}
	{/}
{/eval}

{template index()}
	...
{/template}
```

#{/}

### Подключение папки

Если в пути к подключаемому файлу явно указать, что подключаемый путь - это папка (нужно добавить символ `/` в конце пути),
то подключаться файл будет по правилу: `(название папки|main|index).ss`, например:

#{+= self.example()}

```jade-like
- namespace app

\/// './base/base.ss' ИЛИ
\/// './base/main.ss' ИЛИ
\/// './base/index.ss'
- include './base/'

- template index()
	...
```

```classic
{namespace app}

\/// './base/base.ss' ИЛИ
\/// './base/main.ss' ИЛИ
\/// './base/index.ss'
{include './base/'}

{template index()}
	...
{/template}
```

#{/}

### Обработка [параметров трансляции](guide.html#introSet) при подключении

Если файл Snakeskin определяет параметры трансляции на глобальном уровне, то они также рекурсивно накладываются на
все подключаемые файлы (если они не переопределяются явно в подключаемых файлах), например:

**base.ss**

#{+= self.example()}

```jade-like
- namespace base
@= tolerateWhitespaces true

- template index()
	...
```

```classic
{namespace math}
{@= tolerateWhitespaces true}

{template index()}
	...
{/template}
```

#{/}

**app.ss**

#{+= self.example()}

```jade-like
- namespace app
@= tolerateWhitespaces false
@= renderMode 'dom'

- include './base'
- template index()
	...
```

```classic
{namespace app}
{@= tolerateWhitespaces false}
{@= renderMode 'dom'}

{include './base'}
{template index()}
	...
{/template}
```

#{/}

Здесь файл *base.ss* наследует параметр `renderMode = 'dom'`, но `tolerateWhitespaces` он переопределяет явно.

### Подключение с заданием [renderAs](#compile--renderAs)

Snakeskin позволяет явно задать параметр *renderAs* при подключении файла с помощью ключевого слова `as`, например:

#{+= self.example()}

```jade-like
- namespace app
- include './base' as placeholder
- template index()
	...
```

```classic
{namespace app}
{include './base' as placeholder}
{template index()}
	...
{/template}
```

#{/}

Таким образом мы исключили подключаемые шаблоны из финального файла JS.

### Доступ к глобальным переменным шаблона другого файла при наследовании

При наследовании дочерний шаблон автоматически получает доступ к замыканию родительского шаблона, например:

**base.ss**

#{+= self.example()}

```jade-like
- namespace base
- var hello = 'world'

- template index()
	Hello {hello}!
```

```classic
{namespace base}
{var hello = 'world' /}

{template index()}
	Hello {hello}!
{/template}
```

#{/}

**app.ss**

#{+= self.example()}

```jade-like
- namespace app
- include './base'

- template index() extends base.index
	- block info
		hello = '{hello}'
```

```classic
{namespace app}
{include './base'}

{template index() extends base.index}
	{block info}
		hello = '{hello}'
	{/}
{/template}
```

#{/}

Шаблон `app.index` отрендерится как:

```html
Hello world!
hello = 'world'
```

Если в файле дочернего шаблона существует одноимённая глобальная переменная, то она будет переопределять родительскую:

**app.ss**

#{+= self.example()}

```jade-like
- namespace app
- include './base'

\/// var может быть до include - это никак не влияет
- var hello = 'people'

- template index() extends base.index
	- block info
		hello = '{hello}'
```

```classic
{namespace app}
{include './base'}

\/// var может быть до include - это никак не влияет
{var hello = 'people' /}

{template index() extends base.index}
	{block info}
		hello = '{hello}'
	{/}
{/template}
```

#{/}

Шаблон `app.index` отрендерится как:

```html
Hello people!
hello = 'people'
```

#{/block}
{/template}
