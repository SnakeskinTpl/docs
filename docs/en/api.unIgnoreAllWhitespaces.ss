- namespace docs.en.api['1::Directives']['10::Working with whitespace']['3::unIgnoreAllWhitespaces']

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

The directive declares that all nested whitespace characters should not be ignored
(usually used in conjunction with [ignoreAllWhitespaces](#ignoreAllWhitespaces)).

## Synopsis

| Declaration                              | Shorthand | Directive type | Interpolation |
|------------------------------------------|-----------|----------------|---------------|
| Only within templates or external blocks | `&-`      | Block, logic   | Not required  |

## Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	&+
		Hello             World Bar
		&-
			Hello             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	{&+}
		Hello             World Bar
		{&-}
			Hello             World Bar
		{/}
	{/}
{/template}
```

#{/}

Output:

```html
HelloWorldBarHello World Bar
```

#{/block}
{/template}
