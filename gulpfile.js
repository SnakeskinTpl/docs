'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

const
	gulp = require('gulp'),
	snakeskin = require('gulp-snakeskin'),
	stylus = require('gulp-stylus'),
	autoprefixer = require('gulp-autoprefixer'),
	nib = require('nib'),
	watch = require('gulp-watch');

function error(cb) {
	return (err) => {
		console.error(err.message);
		cb();
	};
}

gulp.task('snakeskin', (cb) => {
	gulp.src('./index.ss')
		.pipe(watch('./**/*.ss'))
		.pipe(snakeskin({exec: true, prettyPrint: true, vars: {lang: 'ru'}}))
		.on('error', error(cb))
		.pipe(gulp.dest('./build'))
		.on('end', cb);
});

gulp.task('stylus', (cb) => {
	gulp.src('./styles/*.styl')
		.pipe(watch('./styles/**/*.styl'))
		.pipe(stylus({use: nib()}))
		.on('error', error(cb))
		.pipe(autoprefixer())
		.pipe(gulp.dest('./build/css'))
		.on('end', cb);
});

gulp.task('default', ['snakeskin', 'stylus']);
