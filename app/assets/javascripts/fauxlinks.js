const elSelector = '[data-trigger-hover]',
      removeElSelector = '[data-remove-hover]',
      hoverClass = 'hover';

function removeHover () {
  let hoveredEl;

  $(removeElSelector).on('mouseenter', function () {
    hoveredEl = $('.' + hoverClass);
    hoveredEl.removeClass(hoverClass);
  }).on('mouseleave', function () {
    hoveredEl.addClass(hoverClass);
  });
}

function triggerHover () {
  const el = $(elSelector);

  el.on('mouseenter', function () {
    $(this).addClass(hoverClass);
  }).on('mouseleave', function () {
    $(this).removeClass(hoverClass);
  });

  removeHover();
}


var fauxlinksReady;
fauxlinksReady = function() {
  triggerHover();
};

$(document).ready(fauxlinksReady);
$(document).on('page:load', fauxlinksReady);
