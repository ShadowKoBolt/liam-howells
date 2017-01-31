var modalNewsletter;
modalNewsletter = function() {
  setTimeout(function() {
    $('#modal-newsletter').modal("show");
  }, 5000);
};

$(document).ready(modalNewsletter);
$(document).on('page:load', modalNewsletter);
