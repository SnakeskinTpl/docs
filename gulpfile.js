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
	snakeskin = require('gulp-snakeskin'),
	stylus = require('gulp-stylus'),
	autoprefixer = require('gulp-autoprefixer'),
	rollup = require('gulp-rollup');

const
	path = require('path'),
	async = require('async'),
	nib = require('nib'),
	babel = require('rollup-plugin-babel'),
	hljs = require('highlight.js');

hljs.registerLanguage('classic', require('./highlight/classic'));
hljs.registerLanguage('jade-like', require('./highlight/jade-like'));

const
	buildFolder = './';

function error() {
	return (err) => {
		console.error(err.message);
	};
}

gulp.task('templates', (cb) => {
	gulp.src('./tpls/*.ss')
		.pipe(snakeskin({exec: true, prettyPrint: true, vars: {lang: 'ru'}}))
		.on('error', error())
		.pipe(gulp.dest(buildFolder))
		.on('end', cb);
});

gulp.task('styles', (cb) => {
	gulp.src('./styles/*.styl')
		.pipe(stylus({use: nib()}))
		.on('error', error())
		.pipe(autoprefixer())
		.pipe(gulp.dest(path.join(buildFolder, 'css')))
		.on('end', cb);
});

gulp.task('dependencies', (cb) => {
	async.parallel([
		(cb) => {
			gulp.src([
				'./node_modules/highlight.js/styles/default.css'
			])

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
		.pipe(rollup({format: 'iife', plugins: [babel()]}))
		.on('error', error())
		.pipe(gulp.dest(path.join(buildFolder, 'js')))
		.on('end', cb);
});

gulp.task('watch', () => {
	gulp.watch(['./tpls/**/*.ss', './docs/**/*.ss'], ['templates']);
	gulp.watch('./styles/**/*.styl', ['styles']);
	gulp.watch('./scripts/**/*.js', ['scripts']);
});

gulp.task('default', ['templates', 'styles', 'scripts', 'dependencies', 'watch']);
