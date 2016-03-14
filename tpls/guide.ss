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
				< header.b-header
					< a.&__logo href = index.html
						< img src = logo.svg | alt = snakeskin template engine
						< .&__logo-text
							nakeskin

					+= self.nav(cluster)

				: contents = {}
				< .b-content-wrapper
					< nav.b-contents
						- block contents(doc, breadcrumbs = []) => docs[@@lang][cluster]
							: sortDoc = Object.keys(doc).sort()

							< ol
								- forEach sortDoc => key
									: &
										el = doc[key],
										href
									.

									? key = key.replace(/^\d+::\s*/, '')

									- if el.main
										? href = Object.keys(el.main)[0]
										? contents[href] = { &
											breadcrumbs: breadcrumbs,
											text: el.main[href](),
											title: key
										} .

									- if key !== 'main'
										< li.&__part[.&_link_${Boolean(href)}]
											- if href
												< a.&__link href = #${href}
													{key}

											- else
												{key}

											- if !el.main
												+= self.contents(el, breadcrumbs.concat(key))

					< .b-articles
						< .&__nav-cont.&__prev
							< .&__nav-control
								< i.fa.fa-angle-left

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

						< .&__nav-cont.&__next
							< .&__nav-control
								< i.fa.fa-angle-right

				< footer.b-footer
					: y = new Date().getFullYear()
					(c) 2016{y !== 2016 ? '-' + y : ''} Snakeskin
					< menu.&__menu
						< li
							< a href = https://github.com/SnakeskinTpl/snakeskin.github.io/issues/new
								Сообщить об ошибке

						< li
							< a href = https://github.com/SnakeskinTpl/Snakeskin
								GitHub

