$(function(){
 
  //Methods
  window.add_price = function(quantity, amount, id){
    var $container = $('#prices_table'),
        $row = $('<tr>'),
        $remove = $('<a id="remove_price" class="close">x</a>');
   
    if (id) {
      $remove.attr('href', '/prices/' + id).attr('data-method', 'delete').attr('rel','nofollow');
    }
        
    var id = id || new Date().getTime();
        
    var $quantity = $('<input type="hidden">').val(quantity).attr('name', 'product[prices_attributes][' + id + '][quantity]');
    var $amount = $('<input type="hidden">').val(amount).attr('name', 'product[prices_attributes][' + id + '][amount]');

    
    $row.append($('<td>').html(quantity));
    $row.append($('<td>').html(amount));
    $row.append($('<td>').html($remove));
    $row.append($quantity);
    $row.append($amount);
    $row.attr('data-id', id)
    
    $container.append($row).removeClass('hide');
    $('#quantity').val('');
    $('#amount').val('');
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

  //Blank inputs when modal is hidden
  $('#price_fields').on('hidden', function () {
    $('#quantity').val('');
    $('#amount').val('')
  });
  
});