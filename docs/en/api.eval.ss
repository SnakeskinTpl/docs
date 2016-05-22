- namespace docs.en.api['1::Directives']['3::Global context']['1::eval']

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

Директива создаёт блок, который выполнится на этапе трансляции, но не войдёт в конечный JS.

## Synopsis

| Declaration                  | Shorthand | Directive type       | Interpolation |
|-----------------------------|--------------------|---------------------|--------------|
| Only in the global scope | Absent        | Block, logic | Not required |

## Description

Т.к. любой код, размещённый вне тела шаблона будет выполняться как на этапе трансляции, так и войдёт в конечный JS код,
то директива *eval* позволяет создать блок, содержимое которого будет исключаться из результирующего кода, но по прежнему
будет выполняться на этапе трансляции.

#{+= self.example()}

```jade-like
- eval
	? console.log('Hello world!')
```

```classic
{eval}
	{? console.log('Hello world!')}
{/}
```

#{/}

Директива может использоваться только в глобальной области.

#{/block}
{/template}
