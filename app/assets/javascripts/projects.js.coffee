$ ->
  $('.actions').on 'ajax:beforeSend', (event, xhr, settings) ->
    settings.url += ('?page=' + window.progressPage)

