- namespace index

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include './modules/base'
- include 'std.ss/html'

- import snakeskin from 'snakeskin'

- base.typograf({lang: @@lang})
- template main()
	- doctype
	< html
		< head
			< meta charset = utf-8
			< title
				{title = `Документация Snakeskin 7` ?}

			- block head
				- with std.html
					+= @cdn('fontAwesome@4.4.0')
					+= @cdn('jquery@2.2.0', 'yandex')

				- link :: https://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700|Open+Sans+Condensed:700&subset=latin,latin-ext,cyrillic,cyrillic-ext
				- link :: https://fonts.googleapis.com/css?family=Roboto+Mono:400,700,400italic,700italic&subset=latin,cyrillic,cyrillic-ext,latin-ext

				- forEach ['highlight/default', 'index'] => url
					- link :: css/{url}.css

		- menu = [ &
			{
				id: 'guide',
				href: 'guide' + @@prfx + '.html',
				label: `Учебник`
			},
			{
				id: 'api',
				href: 'api' + @@prfx + '.html',
				label: `Документация`
			},
			{
				id: 'plugins',
				href: 'guide' + @@prfx + '.html#install' + `--Плагины`,
				label: `Плагины`
			},
			{
				id: 'examples',
				href: 'guide' + @@prfx + '.html#gettingStarted' + `--Способы_использования_и_основные_use-case`,
				label: `Примеры`
			},
			{
				id: 'sandbox',
				href: 'http://codepen.io/kobezzza/pen/zrJNXx',
				label: `Песочница`,
				target: '_blank'
			}
		] .

		- block nav(id)
			< nav.b-nav
				< menu
					- forEach menu => @el
						< li
							- if @id === id
								< strong
									{@label}

							- else
								< a ${el}
									{@label}

		- block body
			< body.b-index-background
				< .b-index-wrapper
					< .&__el[.&_align_center]
						+= self.nav()

						< img.b-index-logo src = logo.svg | alt = snakeskin template engine
						< .b-index-title
							< h1
								Snakeskin

							< h2
								`Удивительно мощный язык описания шаблонов`

						< a.b-install href = guide.html#install
							`Установить Snakeskin`

						< .b-badges
							< a.github-button href = https://github.com/SnakeskinTpl | &
								aria-label = Follow @SnakeskinTpl on GitHub |
								-count-aria-label = # followers on GitHub |
								-count-api = /users/SnakeskinTpl#followers |
								-count-href = /SnakeskinTpl/followers
							.
								Follow @SnakeskinTpl

							< a.github-button href = https://github.com/SnakeskinTpl/Snakeskin | &
								aria-label = Star SnakeskinTpl/Snakeskin on GitHub |
								-count-aria-label = # stargazers on GitHub |
								-count-api = /repos/SnakeskinTpl/Snakeskin#stargazers_count |
								-count-href = /SnakeskinTpl/Snakeskin/stargazers |
								-icon = octicon-star
							.
								Star

							< a.github-button href = https://github.com/SnakeskinTpl/Snakeskin/fork | &
								aria-label = Fork SnakeskinTpl/Snakeskin on GitHub |
								-count-aria-label = # forks on GitHub |
								-count-api = /repos/SnakeskinTpl/Snakeskin#forks_count |
								-count-href = /SnakeskinTpl/Snakeskin/network |
								-icon = octicon-repo-forked
							.
								Fork

							- script js id = github-bjs | src = https://buttons.github.io/buttons.js | async | defer

						< .b-language
							- if @@lang === 'en'
								< a.&__link href = index-ru.html
									< img.&__flag src = https://assets-cdn.github.com/images/icons/emoji/unicode/1f1f7-1f1fa.png | alt = Русская документация
									Русская документация

							- else
								< a.&__link href = index.html
									< img.&__flag src = https://assets-cdn.github.com/images/icons/emoji/unicode/1f1ec-1f1e7.png | alt = English documentation
									English documentation
