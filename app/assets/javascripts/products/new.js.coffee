$ ->
  #Methods
  
  #Add price method
  window.add_price = (quantity, amount, id) ->
    $container = $("#prices_table")
    $row = $("<tr>")
    $remove = $("<a id=\"remove_price\" class=\"close\">x</a>")

    if id
      $remove.attr("href", "/prices/" + id).attr("data-method", "delete").attr "rel", "nofollow"
    else
      _id = new Date().getTime()
      $quantity = $("<input type=\"hidden\">").val(quantity).attr("name", "product[prices_attributes][" + _id + "][quantity]")
      $amount = $("<input type=\"hidden\">").val(amount).attr("name", "product[prices_attributes][" + _id + "][amount]")
      $row.append $quantity
      $row.append $amount

    $row.append $("<td>").html(quantity)
    $row.append $("<td>").html(amount)
    $row.append $("<td>").html($remove)
    $container.append($row).removeClass "hide"
    $("#quantity").val ""
    $("#amount").val ""
  
  #Add property method
  window.add_property = (name, value, id) ->
    $container = $("#properties_table")
    $row = $("<tr>")
    $remove = $("<a id=\"remove_property\" class=\"close\">x</a>")

    if id
      $remove.attr("href", "/properties/" + id).attr("data-method", "delete").attr "rel", "nofollow"
    else
      _id = new Date().getTime()
      $name = $("<input type=\"hidden\">").val(name).attr("name", "product[properties_attributes][" + _id + "][name]")
      $value = $("<input type=\"hidden\">").val(value).attr("name", "product[properties_attributes][" + _id + "][value]")
      $row.append $name
      $row.append $value

    $row.append $("<td>").html(name)
    $row.append $("<td>").html(value)
    $row.append $("<td>").html($remove)
    $container.append($row).removeClass "hide"
    $("#name").val ""
    $("#value").val ""

  #Events
  
  #Add price button
  $("#add_price").on "click", (ev) ->
    quantity = $("#quantity").val()
    amount = $("#amount").val()
    
    #TODO: Validations
    add_price quantity, amount, false
    $("#price_fields").modal "toggle"

  #Remove price button
  $(document).on "click", "#remove_price", (ev) ->
    $row = $(this).parent().parent()
    $tbody = $row.parent()
    $table = $tbody.parent()
    $row.remove()
    $table.addClass "hide"  if $tbody.find("tr").length is 0

  #Add property button
  $("#add_property").on "click", (ev) ->
    name = $("#name").val()
    value = $("#value").val()
    
    #TODO: Validations
    add_property name, value, false
    $("#property_fields").modal "toggle"

  #Remove property button
  $(document).on "click", "#remove_property", (ev) ->
    $row = $(this).parent().parent()
    $tbody = $row.parent()
    $table = $tbody.parent()
    $row.remove()
    $table.addClass "hide"  if $tbody.find("tr").length is 0

  #Load prices and properties on document ready
  $(document).on 'ready', ->
    
    unless $("#product_prices").is(":empty")
      prices = $.parseJSON($("#product_prices").html())
      $.each prices, ->
        add_price @quantity, @amount, @id

    unless $("#product_properties").is(":empty")
      properties = $.parseJSON($('#product_properties').html())
      $.each properties, ->
        add_property @name, @value, @id