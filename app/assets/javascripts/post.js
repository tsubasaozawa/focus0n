$( document ).on('turbolinks:load', function() {
  $(function () {
    $('.main-header__new-post').click(function () {
        $('.form-box').fadeIn('fast');
    });
  });

  $(function () {
    $('.form__close-btn').click(function () {
        $('.form-box').fadeOut('fast');
    });
  });

  $(function () {
    $('.submit-btn').click(function () {
        $('.form-box').fadeOut('fast');
    });
  });

});