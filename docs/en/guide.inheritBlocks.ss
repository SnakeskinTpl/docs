- namespace docs.en.guide['3::Наследование']['5::Наследование вызываемых блоков']

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

Вызываемы блоки - это подвид блоков, которые могут принимать входные параметры и неоднократно применяться в шаблоне.
Наследование содержимого таких блоков осуществляется также, как и у [простых блоков](#inheritBasic), а входные параметры -
по [общей схеме](#inheritParams).

Дополнительно следует отметить, что если блок является немедленно вызываемым, то это поведение также наследуется.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- block hello(name) => 'friend'
		Hello {name}!

- template sub() extends @base
	- block hello(name) => 'world'
		- super
```

```classic
{namespace demo}

{template base()}
	{block hello(name) => 'friend'}
		Hello {name}!
	{/}
{/template}

{template sub() extends @base}
	{block hello(name) => 'world'}
		{super}
	{/}
{/template}
```

#{/}

Результат работы шаблона **sub**:

```
Hello world!
```

#{/block}
{/template}
