$(function(){
  if (window.location.href.match(/\/rooms\/\d+$/)){
    $('.room-show__main').animate({scrollTop: $('.room-show__main')[0].scrollHeight}, 'fast');
  }
});

$(function(){
  function buildHTML(message){
    if( message.user_id == gon.my_id ) {
      var html =
        `<div class="message-container my-container">
          <div class="message-content">
              ${ message.content }
            <div class="message-time my-time">
              <i class="far fa-clock"></i>
              ${ message.created_at }
            </div>
          </div>
        </div>`
        return html;
    } else {
      var html =
    `<div class="message-container">
       <div class="message-user">
         <div class="message-user__icon">
           <img src="/assets/default-5b967e3c90d9eab56cc3c88ffb338aea626894bc30781e8b54cc735e58ad7f90.jpg">
         </div>
         <div class="message-user__name">
           ${ message.user_name}
         </div>
       </div>
       <div class="message-content">
         <div class="message-content__says">
          ${ message.content }
           <div class="message-time">
             <i class="far fa-clock"></i>
             ${ message.created_at }
           </div>
         </div>
       </div>
     </div>`
     return html;
    }
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.room-show__main').append(html);
      $('.room-show__main').animate({scrollTop: $('.room-show__main')[0].scrollHeight}, 'fast');
      $('.message_form')[0].reset();
      $('.message_send__btn').attr('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  })
})