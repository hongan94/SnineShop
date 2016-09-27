$(function(){
  $('.parent_category').click(function(){
   var a =  $(this).attr('id');
   $('.'+a+'').toggleClass('hide');
  });
  $('.parent_product').click(function(){
    var b = $(this).attr('id');
    $('.'+b+'').toggleClass('hide');
  });
});
$(function(){
  $('button.buy').mouseover(function(){
    $(this).css('background','#ff0000');
  });
  $('button.buy').mouseout(function(){
    $(this).css('background','#EFD4D4')
  })
});