'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

global.i18n = (str) => str;

const
	gulp = require('gulp'),
	plumber = require('gulp-plumber'),
	snakeskin = require('gulp-snakeskin'),
	stylus = require('gulp-stylus'),
	autoprefixer = require('gulp-autoprefixer'),
	rollup = require('gulp-rollup'),
	uglify = require('gulp-uglify'),
	csso = require('gulp-csso'),
	run = require('gulp-run'),
	rename = require('gulp-rename'),
	through = require('through2');

const
	fs = require('fs'),
	path = require('path'),
	async = require('async'),
	nib = require('nib'),
	babel = require('rollup-plugin-babel'),
	hljs = require('highlight.js');

hljs.registerLanguage('classic', require('./highlight/classic'));
hljs.registerLanguage('jade-like', require('./highlight/jade-like'));

const
	buildFolder = './';

gulp.task('templates', (cb) => {
	const doc = (cb, lang) => {
		let cluster;
		gulp.src('./tpls/*.ss')
			.pipe(plumber())
			.pipe(through.obj(function (file, enc, cb) {
				cluster = path.basename(file.path, '.ss');
				this.push(file);
				return cb();
			}))

			.pipe(snakeskin({
				exec: true,
				prettyPrint: true,
				language: fs.existsSync(`./${lang}.json`) ? require(`./${lang}.json`) : undefined,
				vars: {
					lang,
					file: () => cluster
				}
			}))

			.pipe(rename({suffix: lang !== 'en' ? `-${lang}` : ''}))
			.pipe(gulp.dest(buildFolder))
			.on('end', cb);
	};

	async.series([
		(cb) => doc(cb, 'en'),
		(cb) => doc(cb, 'ru'),
	], cb);
});

gulp.task('styles', (cb) => {
	gulp.src('./styles/*.styl')
		.pipe(plumber())
		.pipe(stylus({use: nib()}))
		.pipe(autoprefixer())
		.pipe(csso())
		.pipe(gulp.dest(path.join(buildFolder, 'css')))
		.on('end', cb);
});

gulp.task('dependencies', (cb) => {
	async.parallel([
		(cb) => {
			gulp.src([
				'./node_modules/highlight.js/styles/default.css'
			])

				.pipe(plumber())
				.pipe(csso())
				.pipe(gulp.dest(path.join(buildFolder, 'css/highlight')))
				.on('end', cb);
		},

		(cb) => {
			gulp.src([
				'./node_modules/jquery.scrollto/jquery.scrollTo.min.js'
			])

				.pipe(gulp.dest(path.join(buildFolder, 'js')))
				.on('end', cb);
		}

	], cb);
});

gulp.task('scripts', (cb) => {
	gulp.src('./scripts/index.js')
		.pipe(plumber())
		.pipe(rollup({
			allowRealFiles: true,
			entry: './scripts/index.js',
			format: 'iife',
			plugins: [babel()]
		}))

		.pipe(uglify())
		.pipe(gulp.dest(path.join(buildFolder, 'js')))
		.on('end', cb);
});

gulp.task('yaspeller', (cb) => {
	run('yaspeller ./').exec()
		.pipe(plumber())
		.on('finish', cb);
});

gulp.task('watch', () => {
	gulp.watch(['./tpls/**/*.ss', './docs/**/*.ss'], ['templates']);
	gulp.watch('./docs/**/*.ss', ['yaspeller']);
	gulp.watch('./styles/**/*.styl', ['styles']);
	gulp.watch('./scripts/**/*.js', ['scripts']);
});

gulp.task('default', ['templates', 'styles', 'scripts', 'dependencies', 'watch']);
