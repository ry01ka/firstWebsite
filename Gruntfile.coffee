#global module:false
module.exports = (grunt) ->
  'use strict'

  # Project configuration.
  grunt.initConfig

    # Metadata.
    pkg: grunt.file.readJSON 'package.json'

    # Task configuration.
    autoprefixer:
      options:
        browsers: ['ios >= 5', 'android >= 2.3']
      dist:
        src: 'main.css'

    connect:
      dist:
        options:
          port: 8080
          open: 'http://localhost:8080/'

    csscomb:
      dist:
        files:
          'main.css' : ['css.main']

    # csslint:
    #   dist:
    #     options:
    #       csslintrc: 'csslintrc'
    #     src: ['main.css']

    # csso:
    #   dist:
    #     options:
    #       banner:"""
    #       /*
    #        * Main.css
    #        * Copyright 2013 Ryo Ikarashi
    #        * Licensed under the MIT License
    #        */

    #        """
    #        files:
    #         'main.min.css' : ['main.css']

    sass:
      dist:
        files:
          'main.css' : 'main.scss'

    watch:
      options:
        livereload: true

      css:
        files: ['*.scss', '*.html']
        tasks: ['stylesheet', 'publish']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-qunit"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-csso'
  grunt.loadNpmTasks 'grunt-csscss'
  grunt.loadNpmTasks 'grunt-csscomb'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'


  # Default task.
  grunt.registerTask "default", ['develop']
  grunt.registerTask "stylesheet", ['sass', 'autoprefixer', 'csscomb']
  grunt.registerTask "develop", ['connect', 'watch']
  grunt.registerTask "typeset", ['stylesheet']
  grunt.registerTask "publish", ['stylesheet']
  grunt.registerTask "build", ['stylesheet', 'csso']
