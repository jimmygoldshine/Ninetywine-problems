$(document).ready(function() {
  var foodCharacteristics = ["#sweet", "#umami", "#spicy", "#sour", "#bitter"];
  $("#submit-button").hide();
  foodCharacteristics.forEach(function(element) {
    $(element).hide();
  });

  var i = 0;
  $("#next-button").click(function() {
    $(foodCharacteristics[i]).show( "fade" );
    i++;
    if (foodCharacteristics[i] == undefined) {
      $(this).hide();
      $("#submit-button").show( "fade" );
    };
  });
});
