var dateReady;
dateReady = function() {
  flatpickr("[data-input='calendar']");
};

$(document).ready(dateReady);
$(document).on('page:load', dateReady);
