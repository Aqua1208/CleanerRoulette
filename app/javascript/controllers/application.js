import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

$(document).on('turbolinks:load', function() {
  var scrollPosition = $('[data-scroll_position]').data('scroll_position');
  if (scrollPosition) {
    var target = $('#' + scrollPosition);
    if (target.length) {
      $(window).scrollTop(target.offset().top);
    }
  }
});

export { application }
