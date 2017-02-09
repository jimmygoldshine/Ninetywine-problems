$(document).ready(function() {
  $("#chart-id-2").hide();
  $("#chart-id-3").hide();

  $("#wine-id-1").click(function(){
    $("#chart-id-2").hide();
    $("#chart-id-3").hide();
    $("#chart-id-1").show( 1000 );
  });

  $("#wine-id-2").click(function(){
    $("#chart-id-1").hide()
    $("#chart-id-3").hide();
    $("#chart-id-2").show(1000);
  });

  $("#wine-id-3").click(function(){
    $("#chart-id-1").hide()
    $("#chart-id-2").hide();
    $("#chart-id-3").show(1000);
  });
});
