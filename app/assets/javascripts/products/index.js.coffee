$(document).on 'ready', ->
    current_category = $('#current_category').html()
    $("##{current_category}").addClass('active')