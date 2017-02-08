$(document).ready(function() {
  $("#sweet").change(function() {
    val = $("#sweet_slider").val();
    $("#sweet_value").html(val);
  });

  $("#umami").change(function() {
    val = $("#umami_slider").val();
    $("#umami_value").html(val);
  });

  $("#spicy").change(function() {
    val = $("#spicy_slider").val();
    $("#spicy_value").html(val);
  });

  $("#sour").change(function() {
    val = $("#sour_slider").val();
    $("#sour_value").html(val);
  });

  $("#bitter").change(function() {
    val = $("#bitter_slider").val();
    $("#bitter_value").html(val);
  });
})
