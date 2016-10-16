var adminReady;
adminReady = function() {
  new Clipboard('[data-clipboard-target]');
};

$(document).ready(adminReady);
$(document).on('page:load', adminReady);
