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

var rangeSlider = function(){
  var slider = $('.range-slider'),
      range = $('.range-slider__range'),
      value = $('.range-slider__value');

  slider.each(function(){

    value.each(function(){
      var value = $(this).prev().attr('value');
      $(this).html(value);
    });

    range.on('input', function(){
      $(this).next(value).html(this.value);
    });
  });
};

rangeSlider();
