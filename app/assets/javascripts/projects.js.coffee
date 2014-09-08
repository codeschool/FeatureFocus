addLoading = ->
  $('.loading').show()

hideLoading = ->
  $('.loading').hide()

loadMore = ->
  hideLoading()
  return unless hasMoreElements()

  $pager      = $('.loading')
  currentPage = $pager.data('currentPage') || 1
  nextPage    = currentPage + 1

  $.get "/progress.js?page=#{nextPage}"
  $pager.data 'currentPage', nextPage

hasMoreElements = -> $('.loading').length > 0

$ ->
  debouncedLoadMore = _.throttle(loadMore, 3000, leading: false)
  $(window).scroll ->
    if $(window).scrollTop() > $(document).height() - $(window).height() - 50
      addLoading()
      debouncedLoadMore()

