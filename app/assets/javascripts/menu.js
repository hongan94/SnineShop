$(function(){
  $('.parent_category').click(function(){
   var a =  $(this).attr('id');
   $('.'+a+'').toggleClass('hide');
  });
});