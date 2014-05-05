ready = ->
  $('.datetimepicker10').datetimepicker ->
    icons:
      time: 'fa fa-clock-o'
      date: 'fa fa-calendar'
      up:   'fa fa-arrow-up'
      down: 'fa fa-arrow-down'
  return

$(document).ready(ready)
$(document).on('page:load', ready)
