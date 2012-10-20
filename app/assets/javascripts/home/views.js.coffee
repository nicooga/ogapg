$(document).on 'ready', ->
  current_page = $('.page-header').find('h1').attr('id')
  $("##{current_page}_link").addClass('active')