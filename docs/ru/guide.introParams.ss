- namespace docs.ru.guide['2::Основы']['4::Параметры функциональных директив']

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

Функциональные директивы Snakeskin - это такие директивы, которые по своему синтаксису напоминают функции JavaScript, и
как правило при трансляции преобразуются именно в них. Логично, что такие директивы могут принимать входные параметры,
например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(a, b)
	{a + b}
```

```classic
{namespace demo}
{template index(a, b)}
	{a + b}
{/template}
```

#{/}

У параметров может быть значение по умолчанию, которое применяется, если значение параметра будет `null` или `undefined`.

#{+= self.example()}

```jade-like
- namespace demo
- template index(a = 1, b = 2)
	{a + b}
```

```classic
{namespace demo}
{template index(a = 1, b = 2)}
	{a + b}
{/template}
```

#{/}

С помощью специального оператора `?` можно задать, чтобы значение по умолчанию ставилось только при `undefined`.

#{+= self.example()}

```jade-like
- namespace demo
- template index(a? = 1, b? = 2)
	{a + b}
```

```classic
{namespace demo}
{template index(a? = 1, b? = 2)}
	{a + b}
{/template}
```

#{/}

Существует также оператор `!`, который отменяет оператор `?`, но он используется только при наследовании блоков или шаблонов.

## with биндинг

Оператор `@` осуществляет привязку параметра к директиве [with](api.html#with), например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(@params)
	{@name} \/// params.name
```

```classic
{namespace demo}
{template index(@params)}
	{@name} \/// params.name
{/template}
```

#{/}

#{/block}
{/template}
