var scrollReady;
scrollReady = function() {
  $("[data-id='home-scroll-to']").click(function(event) {
    event.preventDefault();
    $(window).scrollTo($("[data-id='home-how-it-works']"), 400);
  });
  $("[data-id='nav-packages']").click(function(event) {
    if (window.location.pathname == "/") {
      event.preventDefault();
      $(window).scrollTo($("[data-id='home-packages']"), 400);
    }
  });
};

$(document).ready(scrollReady);
$(document).on('page:load', scrollReady);
