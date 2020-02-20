$(function(){
  window.onload = function(){
    console.log("success")
    // 一番下までスクロールする
    $('.room-show__main').animate({scrollTop: $('.room-show__main')[0].scrollHeight}, 'fast');
  };
});