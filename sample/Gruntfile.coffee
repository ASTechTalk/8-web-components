'use strict'

module.exports = (grunt)->
  port = grunt.option('port') || 8000
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    bower:
      install:
        options:
          targetDir: './libs'
          layout: 'byComponent'
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: false
    connect:
      site:
        options:
          port: port,
          base: '.'
    watch:
      all_files:
        files: ["**/*.html", "js/**/*.js", "css/**/*.css"]
        options:
          livereload: true

  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "init", ["bower:install"]
  grunt.registerTask "default", ["connect", "watch"]
