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