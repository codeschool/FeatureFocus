$ ->
  $('.simple-timer').startTimer
    onComplete: -> location.reload()

  $('.referral input').on 'click', -> $(@).select()
