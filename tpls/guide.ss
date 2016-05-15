- namespace guide

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- @@cluster = @@file()
- include './index'
- include '../docs/' + @@lang + '/' + @@cluster + '.*'

- template main() extends index.main
	- block head
		- super
		- forEach ['jquery.scrollTo.min', 'index'] => url
			- script js src = js/${url}.js

	- block body
		< body
			< .b-doc-wrapper
				< header.b-header
					< a.&__logo href = index${@@prfx}.html
						< img src = logo.svg | alt = snakeskin template engine
						< .&__logo-text
							nakeskin

					+= self.nav(@@cluster)

				: contents = {}
				< .b-content-wrapper
					< nav.b-contents
						- block contents(doc, breadcrumbs = []) => docs[@@lang][@@cluster]
							: putIn sort
								() => a, b
									: pos = /^(\d+)\s*/
									? a = pos.exec(a)[1]
									? b = pos.exec(b)[1]
									- return a - b

							: sortDoc = Object.keys(doc).sort(sort)

							< ol
								- forEach sortDoc => key
									: &
										el = doc[key],
										href
									.

									? key = key.replace(/^\d+::\s*/, '')

									- if el.main
										: name = Object.keys(el.main)[0]
										? href = name.replace(/^\w+?\./, '')
										? contents[href] = { &
											breadcrumbs: breadcrumbs,
											text: el.main[name](),
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
								`Сообщить об ошибке`

						< li
							< a href = https://github.com/SnakeskinTpl/Snakeskin
								GitHub

