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

- template main() extends index.main
	- cluster = 'guide'
	- block body
		< .b-background.b-doc-wrapper
			< header.b-header
				< a href = index.html
					< img.&__logo src = ../logo.svg | alt = snakeskin template engine
				+= self.nav()

			: contents = {}
			< .b-content-wrapper
				< nav.b-contents
					- block contents(doc, breadcrumbs = []) => docs[@@lang][cluster]
						< ul
							- forEach doc => el, key
								: href

								- if el.main
									? href = Object.keys(el.main)[0]
									? contents[href] = { &
										breadcrumbs: breadcrumbs,
										text: el.main[href](),
										title: key
									} .

								- if key !== 'main'
									< li
										- if href
											< a href = #${href}
												{key}

										- else
											{key}

										- if !el.main
											+= self.contents(el, breadcrumbs.concat(key))

				< .b-articles
					- forEach contents => @el, key
						< article#${key}.b-article
							+= @text
