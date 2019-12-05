$( document ).on('turbolinks:load', function() {

  $(function(){
    $(".top-menu").on("mouseenter",function(){
      $('.left-menu').animate({ height: 'show'}, 'fast' );
    });
  });

  $(function(){
    $(".top-menu").on("mouseleave",function(){
      $('.left-menu').animate({ height: 'hide'}, 'fast' );
    });
  });

  $(function(){
    $('.left-searchlist p').click(function(){
      $(this).next('.left-searchlist .left-searchlist__menu').slideToggle('fast');
      $('.left-searchlist p').not($(this)).next('.left-searchlist .left-searchlist__menu').slideUp('fast');
    
    });
  });

  $(function(){
    $(".left-menu__close-btn__text").on("click",function(){
      $('.left-menu').animate({ height: 'toggle'}, 'fast' );
    });
  });

});