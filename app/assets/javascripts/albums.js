// Generated by CoffeeScript 1.10.0
(function() {
  $(document).on("turbolinks:load", function() {
    var backgrounds, chosenAlbum;
    backgrounds = $("#albums-bg-container").children();
    chosenAlbum = 1;
    backgrounds.first().css("opacity", "1");
    return window.setInterval(function() {
      if (chosenAlbum < backgrounds.length) {
        chosenAlbum++;
      } else {
        chosenAlbum = 1;
      }
      backgrounds.css("opacity", "0");
      return $("#albums-bg-container img:nth-child(" + chosenAlbum + ")").css("opacity", "1");
    }, 15000);
  });

}).call(this);
