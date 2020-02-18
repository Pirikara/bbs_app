$(document).on('turbolinks:load', function(){
  $(function(){
    $(document).on('change', '#room_image', function(){
      var file = $('input[type="file"]').prop('files')[0];
      var fileReader = new FileReader();

      fileReader.onloadend = function(){
        var src = fileReader.result;
        $('.room-form__image__label').children('img').attr('src', src);
      }
      fileReader.readAsDataURL(file);
    })
  })
})