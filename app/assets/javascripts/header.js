$( document ).on('turbolinks:load', function() {
  $(function(){
    $(".top-menu").on("click",function(){
      $('.top-menu__select-list').animate({ height: 'toggle'}, 'nomal' );
    });
  });
});