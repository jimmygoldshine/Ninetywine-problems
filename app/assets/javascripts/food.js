$(document).ready(function() {
  $("#submit-button").hide();
  $("#sweet").hide();
  $("#umami").hide();
  $("#sour").hide();
  $("#bitter").hide();
  $("#spicy").hide();

  // add an element to the dom
  // a button called 'next'
  $("#next-button").click(function() {
    $("#sweet").show()
  });
  // when you press it, it appends a form field
  // to the dom, deletes the old next button
  // and writes a new one in
});
