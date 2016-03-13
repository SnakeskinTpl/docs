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

	- block head
		- super
		- script js src = js/index.js

	- block body
		< body
			< .b-doc-wrapper
				< header
					< .b-header
						< a.&__logo href = index.html
							< img src = ../logo.svg | alt = snakeskin template engine
							< .&__logo-text
								nakeskin

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
							< section#${key}.b-article
								- if @breadcrumbs.length
									< ul.b-breadcrumbs
										- forEach @breadcrumbs => title, i, data, isFirst, isLast
											< li
												- if !i
													< i.fa.fa-home
													< .fa.fa-angle-right

												{title}

												- if !isLast
													< .fa.fa-angle-right

								< h1
									{@title}

								+= @text
