#= require active_admin/base

$(document).ready () ->
  initToken()

@initToken = () ->
  $("#token").on 'click', (e) ->
    e.preventDefault()

    $("#token_code").val Math.random().toString(36).substr(2).substr(8)

    e.stopPropagation()
