- namespace docs.en.guide['3::Наследование']['2::Наследование входных параметров']

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

При наследовании шаблон или блок наследует входные параметры родителя только в случае явного перечисления,
при этом если входной параметр имеет у родителя значение по умолчанию, а у потомка оно не указано, то оно наследуется также.

#{+= self.example()}

```jade-like
- namespace demo

- template base(a = 1, b)

\/// Шаблон имеет один параметр "a" со значением по умолчанию 1
- template child(a) extends @base

\/// Шаблон имеет один параметр "a" со значением по умолчанию 2
- template child2(a = 2) extends @base
```

```classic
{namespace demo}

{template base(a = 1, b)}
{/template}

\/// Шаблон имеет один параметр "a" со значением по умолчанию 1
{template child(a) extends @base}
{/template}

\/// Шаблон имеет один параметр "a" со значением по умолчанию 2
{template child2(a = 2) extends @base}
{/template}
```

#{/}

Наследуется и отношения параметра к `null` - `?` и `!`, причём в дочернем шаблоне можно переопределить поведение, например:

#{+= self.example()}

```jade-like
- namespace demo

- template base(a? = 1)

- template child(a!) extends @base
```

```classic
{namespace demo}

{template base(a? = 1)}
{/template}

{template child(a!) extends @base}
{/template}
```

#{/}

Фильтры параметров также наследуются, причём мы можем добавлять новые фильтры в дочернем шаблоне
(они будут применятся после родительских).

#{+= self.example()}

```jade-like
- namespace demo

- template base((a|trim))

\/// a|trim|ucfirst
- template child((a|ucfirst)) extends @base
```

```classic
{namespace demo}

{template base((a|trim))}
{/template}

\/// a|trim|ucfirst
{template child((a|ucfirst)) extends @base}
{/template}
```

#{/}

Параметры имеют привязку по своему названию, а не порядку.

#{+= self.example()}

```jade-like
- namespace demo

- template base(a = 1, b = 2)

\/// b = 2, a = 1
- template child(b, a) extends @base
```

```classic
{namespace demo}

{template base(a = 1, b = 2)}
{/template}

\/// b = 2, a = 1
{template child(b, a) extends @base}
{/template}
```

#{/}

В случае если потомок исключает родительский параметр, то он становится простой локальной переменной внутри шаблона.

#{+= self.example()}

```jade-like
- namespace demo

- template base(a = 1)

\/// Параметр "a" стал переменной со значением a = 1
- template child() extends @base
```

```classic
{namespace demo}

{template base(a = 1)}
{/template}

\/// Параметр "a" стал переменной со значением a = 1
{template child() extends @base}
{/template}
```

#{/}

Помимо исключения родительских параметров в дочернем шаблоне допускается и добавление новых.

#{+= self.example()}

```jade-like
- namespace demo

- template base(a = 1)

- template child(b = 3, a) extends @base
```

```classic
{namespace demo}

{template base(a = 1)}
{/template}

{template child(b = 3, a) extends @base}
{/template}
```

#{/}

[with](api#{@@prfx}.html#with) биндинг параметров также наследуется, если он не был переопределён явно.

#{+= self.example()}

```jade-like
- namespace demo

- template helloWorld(@params = {name: 'friend'})
	< h1
		Hello {@name}!

\/// params наследуется как @params
- template helloWorld2(params) extends @helloWorld
```

```classic
{namespace demo}

{template helloWorld(@params = {name: 'friend'})}
	<h1>Hello {@name}!</h1>
{/template}

\/// params наследуется как @params
{template helloWorld2(params) extends @helloWorld}
{/template}
```

#{/}

#{/block}
{/template}
