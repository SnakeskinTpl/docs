- namespace docs.en.api['1::Directives']['1::Creating templates']['2::template']

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

This directive declares a pattern with specified name and input parameters.

## Synopsis

| Declaration                                                                                 | Shorthand | Directive type                       | Interpolation |
|--------------------------------------------------------------------------------------------|--------------------|-------------------------------------|--------------|
| Only in the global scope, require pre-declaration of [namespace] (# namespace) | Absent        | Block, logic, function | Not required |

## Description

Snakeskin pattern is just a JavaScript function that can be used inside regular code after being transpiled.
Every patterns returns a string by default. You can adjust this behaviour by specifying a custom [renderMode](#compile--renderMode)
or explicit [return](#return) of a value.

A pattern's name matches name of a function in JavaScript, so it should comply the same rules.
Pattern declaration should be preceeded by namespace declaration and should have a unique name.
Besides, a pattern can be declared only within global scope. Nesting is not allowed - use [blocks](#block) 
for this.

The directive is very similar to declaration of functions in JavaScript, for instance:

#{+= self.example()}

```jade-like
- namespace demo
- template index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

You can find more advanced ways of parameters declaring [here](#{@@guide}#introParams).

## Nested namespaces

При декларации шаблона можно использовать пространства имён, подобно тому, как это делается в [namespace](#namespace),
например:

**foo/index.ss**

#{+= self.example()}

```jade-like
- namespace demo
- template %fileName%.index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template %fileName%.index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Механика здесь точно такая же, как и у *namespace*, поэтому рассматриваться отдельно не будет, однако, есть небольшой
дополнительный нюанс: если последняя часть имени декларируется без квадратных скобок, то она будет установлена как свойство
`name` полученной функции JavaScript, т.е.

#{+= self.example()}

```jade-like
- namespace demo
- template index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Превратится в:

```js
exports.demo.index = function index(name) {
	name = name != null ? name : 'world';
	return 'Hello ' + name + '!';
};
```

### Predefined variables

There is a couple of predefined constants and functions that can be used inside patterns.

`TPL_NAME` - a string containing a full pattern's name along with name of namespace as it was at the moment of declaration.

`PARENT_TPL_NAME` - a string containing a full name of a pattern's parent along its namespace as it was at the moment of 
declaration.

`callee` - link to a running pattern (i.e. function).

`self` - link to a `callee.Blocks` object, containing blocks (methods) of a running pattern.

`$0` - link to current DOM node (only if renderMode equals 'dom').

`$class` - значение [липкой ссылки]()#tag--Ссылки_на_родительский_класс;

`getTplResult` - a function returning a pattern's result. Accepts a boolean argument, pointing whether the result should
be reseted after the function calling.

`clearTplResult` - a function that resets a pattern's result.

### Modificators

Snakeskin patterns support declaration modificators.

#### Generator pattern

A pattern would be translated into a generator function (you should use a polyfill for older browsers).

#{+= self.example()}

```jade-like
- namespace demo
- template *hello()
	- yield
		Hello world!
```

```classic
{namespace demo}
{template *hello()}
	{yield}
		Hello world!
	{/}
{/template}
```

#{/}

#### Async pattern

A pattern would be translated into an *async* function (you should use a polyfill for older browsers).

#{+= self.example()}

```jade-like
- namespace demo
- async template hello()
	- var data = await db.getData()
	Hello {data.name}!
```

```classic
{namespace demo}
{async template hello()}
	{var data = await db.getData() /}
	Hello {data.name}!
{/template}
```

#{/}

#### Decorators

Every pattern can be attached by decorator functions (that can also be patterns).
Decorator accepts a link to original function and must return a function as its result.

#{+= self.example()}

```jade-like
- namespace demo
- import Typograf from 'typograf'

- template typograf(params)
	- return
		() => target
			- return
				() =>
					- return new Typograf(params).execute(target.apply(this, arguments))

- @typograf({lang: 'ru'})
- template index()
	Sport is well!
```

```classic
{namespace demo}
{import Typograf from 'typograf'}

{template typograf(params)}
	{return}
		{() => target}
			{return}
				{() =>}
					{return new Typograf(params).execute(target.apply(this, arguments)) /}
				{/}
			{/}
		{/}
	{/}
{/template}

{@typograf({lang: 'ru'})}
{template index()}
	Sport is well!
{/template}
```

#{/}

### Local translation options

When declaring a pattern specific [translation rules](#{@@guide}#introSet) can be specified by using `@=` operator.

#{+= self.example()}

```jade-like
- namespace demo
- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{namespace demo}
{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

### Pattern inheritance

Snakeskin patterns are similar to classes in other programming language, it means they have methods, properties and could
inherit from others. Keyword **extends** is used to setup inheritance.

#{+= self.example()}

```jade-like
- namespace demo
- template index() extends anotherTemplate
	...
```

```classic
{namespace demo}
{template index() extends anotherTemplate
	...
{/template}
```

#{/}

[Подробнее про наследование](#{@@guide}#inheritBasic).

### Explicit call of a pattern inside other pattern

Since Snakeskin patterns are just functions they can be called inside each other via the [call](#call) directive.

#{+= self.example()}

```jade-like
- namespace demo

- template hello()
	Hello world!

- template index()
	\/// Because "hello" and "index" are declared in the same
	\/// namespace, we can use brief form of call 
	\/// (full form {+= demo.hello() /} is also avaliable though).
	+= @hello()
```

```classic
{namespace demo}

{template hello()}
	Hello world!
{/template}

{template index()}
	\/// Because "hello" and "index" are declared in the same
	\/// namespace, we can use brief form of call 
	\/// (full form {+= demo.hello() /} is also avaliable though).
	{+= @hello() /}
{/template}
```

#{/}

#{/block}
{/template}
