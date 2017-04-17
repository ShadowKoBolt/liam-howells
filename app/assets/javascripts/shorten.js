var shorten;
shorten = function() {
  $("[data-more]").click(function(event) {
    event.preventDefault();
    link = $(event.target);
    link.siblings("[data-long]").removeClass("hidden");
    link.siblings("[data-short]").addClass("hidden");
    link.addClass("hidden");
  });
};

$(document).ready(shorten);
$(document).on('page:load', shorten);
