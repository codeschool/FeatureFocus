$(document).on 'click', '[data-behavior=load_more]', (event) ->
  event.stopPropagation()
  event.preventDefault()

  $pager      = $(event.currentTarget)
  currentPage = $pager.data('currentPage') || 0
  nextPage    = currentPage + 1

  $.get "/progress.js?page=#{nextPage}"

  $pager.data 'currentPage', nextPage
