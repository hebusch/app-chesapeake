$(document).ready(function(){

  $("#codeInput").keyup(function(e){
    var length = this.value.length;
    if (length == $(this).attr("maxlength")) {
      $("#sendInput").click();
    }
  });


  $(".modal-close").click(function(){
    $(".modal").toggleClass('is-active');
    $("#codeInput").focus();
  });


});
