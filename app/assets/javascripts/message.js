$(function(){
  if (window.location.href.match(/\/rooms\/\d+$/)){
    console.log("success")
    $('.room-show__main').animate({scrollTop: $('.room-show__main')[0].scrollHeight}, 'fast');
  }
});