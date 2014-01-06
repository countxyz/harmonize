$(document).on 'ready page:load', ->
  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',  
    height: 500,  
    slotMinutes: 30,
    eventSources: [{
      url: '/events.json'
      }],
      timeFormat: 'h:mm t{ - h:mm t} ',  
      dragOpacity: "0.5" 
      eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->  
        updateEvent(event);  
      eventResize: (event, dayDelta, minuteDelta, revertFunc) ->  
        updateEvent(event);

updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      description: the_event.description,
      start_time: "" + the_event.start,
      end_time: "" + the_event.end
