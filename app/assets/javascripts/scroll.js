var scrollReady;
scrollReady = function() {
  $("[data-id='home-scroll-to']").click(function(event) {
    event.preventDefault();
    $(window).scrollTo($("[data-id='home-how-it-works']"), 400);
  });
};

$(document).ready(scrollReady);
$(document).on('page:load', scrollReady);
