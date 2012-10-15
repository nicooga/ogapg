$(function(){
 
  //Methods
  
  //Add price method
  window.add_price = function(quantity,amount,id) {
    var $container = $('#prices_table'),
        $row = $('<tr>'),
        $remove = $('<td><a id="remove_price" class="close">x</a></td>');
         
    var id = id || new Date().getTime();
        
    var $quantity = $('<input type="hidden">').val(quantity).attr('name', 'product[prices_attributes][' + id + '][quantity]');
    var $amount = $('<input type="hidden">').val(amount).attr('name', 'product[prices_attributes][' + id + '][amount]');

    
    $row.append($('<td>').html(quantity));
    $row.append($('<td>').html(amount));
    $row.append($remove);
    $row.append($quantity);
    $row.append($amount);
    
    $container.append($row).removeClass('hide');
    $('#quantity').val('');
    $('#amount').val('');
  }
  
  //Add property method
  window.add_property = function(name,value,id) {
    var $container = $('#properties_table'),
        $row = $('<tr>'),
        $remove = $('<td><a id="remove_property" class="close">x</a></td>');
        
    var id = id || new Date().getTime();
    
    var $name = $('<input type="hidden">').val(name).attr('name', 'product[properties_attributes][' + id + '][name]');
    var $value = $('<input type="hidden">').val(value).attr('name', 'product[properties_attributes][' + id + '][value]');
    
    $row.append($('<td>').html(name));
    $row.append($('<td>').html(value));
    $row.append($remove);
    $row.append($name);
    $row.append($value);

    $container.append($row).removeClass('hide')
    $('#name').val('');
    $('#value').val('');
  }

  //Events
  
  //Add price button
  $('#add_price').on('click', function(ev){
    var quantity = $('#quantity').val(), 
        amount = $('#amount').val();
    //TODO: Validations
    add_price(quantity, amount, false);
    $('#price_fields').modal('toggle')
  });
  
  //Remove price button
  $(document).on('click', '#remove_price', function(ev) {
    var $row = $(this).parent().parent();
    var $tbody = $row.parent();
    var $table = $tbody.parent();
    
    $row.remove();
    if ($tbody.find('tr').length == 0) {
      $table.addClass('hide');
    }
  });
  
  //Add property button
  $('#add_property').on('click', function(ev){
    var name = $('#name').val(), 
        value = $('#value').val();
    //TODO: Validations
    add_property(name, value, false);
    $('#property_fields').modal('toggle')
  });
  
  //Remove property button
  $(document).on('click', '#remove_property', function(ev) {
    var $row = $(this).parent().parent();
    var $tbody = $row.parent();
    var $table = $tbody.parent();
    
    $row.remove();
    if ($tbody.find('tr').length == 0) {
      $table.addClass('hide');
    }
  });

  //Blank inputs when modal is hidden
  $('#price_fields').on('hidden', function () {
    $('#quantity').val('');
    $('#amount').val('')
  });

});