- namespace guide

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include './index'
- include '../docs/*/*'

- block main->doc(el, key, i = 2, cont = [])
	- if key === 'main'
		: hash = Object.keys(el)[0]
		< .doc#doc-${hash}
			+= cont.join('')
			+= el[hash]()

	- else if typeof el !== 'function'
		- target cont
			< h${i}
				{key}

		- forEach el => el, key
			+= self.doc(el, key, ++i, cont)

- template main() extends index.main
	- block body
		: doc = docs[@@lang].guide
		< ul
			- forEach doc => el, key
				< li
					{key}

		- forEach doc => el, key
			+= self.doc(el, key)

