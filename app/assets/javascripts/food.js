$(document).ready(function() {
  var foodCharacteristics = ["#sweet", "#umami", "#spicy", "#sour", "#bitter"];
  $("#submit-button").hide();
  foodCharacteristics.forEach(function(element) {
    $(element).hide();
  });

  var i = 0
  $("#next-button").click(function() {
    if (foodCharacteristics[i] == "#bitter") {
      $(foodCharacteristics[i]).show( "fade" );
      $(this).hide();
      $("#submit-button").show( "fade" );
    } else {
      $(foodCharacteristics[i]).show( "fade" );
      i++;
    };
  });

});
