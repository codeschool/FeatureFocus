# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.actions').on 'ajax:beforeSend', (event, xhr, settings) ->
    settings.url += ('?page=' + window.progressPage)

