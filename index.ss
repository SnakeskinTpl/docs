- namespace index

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include './docs/*/*'

- block main->doc(el, key, i = 2)
	: cont = []
	- if key === 'main'
		: hash = Object.keys(el)[0]
		< .doc#doc-${hash}
			+= cont.join('')
			+= el[hash]()

	- else if typeof el !== 'function'
		- target cont
			< h
				{key}

		- forEach el => el, key
			+= self.doc(el, key, ++i)

- template main(@params = {})
	- doctype
	< html
		< head
			< meta charset = utf-8
			< title
				Документация Snakeskin 7

		< body
			: doc = docs[@lang || 'ru']
			< ul
				- forEach doc => el, key
					< li
						{key}

			- forEach doc => el, key
				+= self.doc(el, key)

