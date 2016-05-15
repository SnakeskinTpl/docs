- namespace docs.en.api['1::Directives']['5::Переменные']['3::global']

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

Директива создаёт супер-глобальную переменную с указанным именем и значением.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы                     | Интерполяция |
|-----------------|--------------------|-----------------------------------|--------------|
| Без ограничений | Не требуется       | Строковая, текстовая / логическая | Не требуется |

## Описание

Супер-глобальная переменная Snakeskin - это свойство объекта `Snakeskin.Vars`, т.е. такая переменная доступна как из JavaScript,
так и **во всех** файлах шаблонов. Устанавливать такие переменные можно из JS (причём можно до трансляции)
или из шаблонов. Основной use-case супер-глобальных переменных - это прокидывание конфига, т.е. некоторый
аналог переменных среды в операционной системе.

### Задание из JS

Чтобы задать значение супер-глобальной переменной перед непосредственной трансляцией можно использовать параметр [vars](#compile--vars),
а также в любой момент времени допускается вносить изменения напрямую в объект `Snakeskin.Vars`, например:

```js
Snakeskin.Vars.server = 'localhost';
Snakeskin.Vars.port = '1989';
```

### Задание и чтение из SS

Для задания супер-глобальной переменной из SS можно использовать несколько способов:

1. Использование директивы *global*, например:

#{+= self.example()}

```jade-like
- global server = 'localhost'
- global port = '1989'
```

```classic
{global server = 'localhost'}
{global port = '1989'}
```

#{/}

Вне тела шаблонов можно опустить ключевое слово `global`:

#{+= self.example()}

```jade-like
- server = 'localhost'
- port = '1989'
```

```classic
{server = 'localhost'}
{port = '1989'}
```

#{/}

При задании имение допускается использовать скобочную нотацию:

#{+= self.example()}

```jade-like
- ['server'] = 'localhost'
- ['port'] = '1989'
```

```classic
{['server'] = 'localhost'}
{['port'] = '1989'}
```

#{/}

2. Использование литеральной формы через модификатор `@@`, например:

#{+= self.example()}

```jade-like
- @@server = 'localhost'
- @@port = '1989'
```

```classic
{@@server = 'localhost'}
{@@port = '1989'}
```

#{/}

Такой вариант можно использовать как вне шаблонов, так и внутри их.
Литеральная форма также поддерживает скобочную нотацию:

#{+= self.example()}

```jade-like
- @@['server'] = 'localhost'
- @@['port'] = '1989'
```

```classic
{@@['server'] = 'localhost'}
{@@['port'] = '1989'}
```

#{/}

#### Чтение

Для чтения супер-глобальных переменных используется модификатор `@@`, например:

#{+= self.example()}

```jade-like
- @@server = 'localhost'
? console.log(@@server)
```

```classic
{@@server = 'localhost'}
{? console.log(@@server)}
```

#{/}

### Вызываемые переменные

Если в конце декларации супер-глобальной переменной поставить символ `?`, то её значение сразу же выведется в шаблон.

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	< title
		- @@title = 'Главная страница' ?
```

```classic
{namespace demo}
{template calc(a, b)}
	{< title}
		{@@title = 'Главная страница' ?}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
