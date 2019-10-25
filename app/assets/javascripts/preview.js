// $( document ).on('turbolinks:load', function() {
//   function readURL(input) {
//     if (input.files && input.files[0]) {

//     var reader = new FileReader();
    
//       reader.onload = function (e) {

//       $('#img_prev').append($('<img>').attr('src', e.target.result));
//       }
      
//       reader.readAsDataURL(input.files[0]);


//     }
//   }
//   $(".form__left-inputbox__image__box__file").change(function(){
//       readURL(this);
//   });
// });


$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {

    var reader = new FileReader();
    
      reader.onload = function (e) {

      $('#img_prev').append($('<video>').attr('src',e.target.result).attr({controls: "true", autobuffer: "true"}));
      }
      reader.readAsDataURL(input.files[0]);


    }
  }
  $(".form__left-inputbox__image__box__file").change(function(){
      readURL(this);
  });
  
});