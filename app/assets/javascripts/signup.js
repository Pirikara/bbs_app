$(function() {
  //始めにjQueryで送信ボタンを無効化する
  $('.send-btn').prop("disabled", true);
  
  //始めにjQueryで必須欄を加工する
  $('form input:required').each(function () {
      $(this).prev("label").addClass("required");
  });
  
  //入力欄の操作時
  $('form input:required').change(function () {
      //必須項目が空かどうかフラグ
      let flag = true;
      //必須項目をひとつずつチェック
      $('form input:required').each(function(e) {
          //もし必須項目が空なら
          if ($('form input:required').eq(e).val() === "") {
              flag = false;
          }
      });
      //全て埋まっていたら
      if (flag) {
          //送信ボタンを復活
          $('.send-btn').prop("disabled", false);
          //送信ボタンの色を変える
          $('.send-btn').css({'background-color':'#00afaf', 'border':'1px solid #00afaf' })
      }
      else {
          //送信ボタンを閉じる
          $('.send-btn').prop("disabled", true);

          $('.send-btn').css({'background-color':'#837D7C', 'border':'1px solid #837D7C' })

      }
  });
});