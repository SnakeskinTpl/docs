- namespace docs.en.api['1::Directives']['10::Working with whitespace']['1::ignoreWhitespaces']

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

The Directive declares that all subsequent whitespace characters until first non-whitespace should be ignored.

## Synopsis

| Declaration                              | Shorthand | Directive type | Interpolation |
|------------------------------------------|-----------|----------------|---------------|
| Only within templates or external blocks | `&`       | Inline, logic  | Not required  |

## Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value, area)
	Hello{&}             World Bar
```

```classic
{namespace demo}
{template index(value, area)}
	Hello{&}             World Bar
{/template}
```

#{/}

Output:

```html
HelloWorld Bar
```

#{/block}
{/template}
