function moveEvent(event, dayDelta, minuteDelta, allDay){
  jQuery.ajax({
    data: 'id=' + event.id + '&title=' + event.title + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta + '&all_day=' + allDay + '&authenticity_token=' + authenticity_token,
    dataType: 'script',
    type: 'post',
    url: "/events/move"
  });
}

function resizeEvent(event, dayDelta, minuteDelta){
  jQuery.ajax({
    data: 'id=' + event.id + '&title=' + event.title + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta + '&authenticity_token=' + authenticity_token,
    dataType: 'script',
    type: 'post',
    url: "/events/resize"
  });
}

function showEventDetails(event){
  $('#event_desc').html(event.description);
  $('#edit_event').html("<a href = 'javascript:void(0);' onclick ='editEvent(" + event.id + ")'>Edit</a>");
    if (event.recurring) {
      title = event.title + "(Recurring)";
      $('#delete_event').html("&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + event.id + ", " + false + ")'>Delete Only This Occurrence</a>");
      $('#delete_event').append("&nbsp;&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + event.id + ", " + true + ")'>Delete All In Series</a>")
      $('#delete_event').append("&nbsp;&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + event.id + ", \"future\")'>Delete All Future Events</a>")
    }
    else {
      title = event.title;
      $('#delete_event').html("<a href = 'javascript:void(0);' onclick ='deleteEvent(" + event.id + ", " + false + ")'>Delete</a>");
    }
    $('#desc_dialog').dialog({
      title: title,
      modal: true,
      width: 500,
      close: function(event, ui){
        $('#desc_dialog').dialog('destroy')
      }       
    });    
}

function editEvent(event_id){
  jQuery.ajax({
    url: "/events/" + event_id + "/edit",
    success: function(data) {
      $('#event_desc').html(data['form']);
    } 
  });
}

function deleteEvent(event_id, delete_all){
  jQuery.ajax({
    data: 'authenticity_token=' + authenticity_token + '&delete_all=' + delete_all,
    dataType: 'script',
    type: 'delete',
    url: "/events/" + event_id,
    success: refetch_events_and_close_dialog
  });
}

function refetch_events_and_close_dialog() {
  $('#calendar').fullCalendar( 'refetchEvents' );
  $('.dialog:visible').dialog('destroy');
}

$(document).ready(function(){
  $('#new_event').click(function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      beforeSend: function() {
        $('#loading').show();
      },
      complete: function() {
        $('#loading').hide();
      },
      success: function(data) {
        $('#create_event').replaceWith(data['form']);
        $('#create_event_dialog').dialog({
          title: 'New Event',
          modal: true,
          width: 500,
          close: function(event, ui) { $('#create_event_dialog').dialog('destroy') }
        });
      }
    });
  });

  $('#calendar').fullCalendar({
    editable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    height: 500,
    slotMinutes: 15,
    loading: function(bool){
      if (bool) 
          $('#loading').show();
      else 
          $('#loading').hide();
    },
    events: "/events/get_events",
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5",
    eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
      moveEvent(event, dayDelta, minuteDelta, allDay);
    },          
    eventResize: function(event, dayDelta, minuteDelta, revertFunc){
      resizeEvent(event, dayDelta, minuteDelta);
    },          
    eventClick: function(event, jsEvent, view){
      showEventDetails(event);
    },      
  });
});

$(document).ready(function(){
  $('#create_event_dialog, #desc_dialog').on('submit', "#event_form", function(event) {
    var $spinner = $('.spinner');
    event.preventDefault();
    $.ajax({
      type: "POST",
      data: $(this).serialize(),
      url: $(this).attr('action'),
      beforeSend: show_spinner,
      complete: hide_spinner,
      success: refetch_events_and_close_dialog,
      error: handle_error
    });

    function show_spinner() {
      $spinner.show();
    }

    function hide_spinner() {
      $spinner.hide();
    }

    function handle_error(xhr) {
      alert(xhr.responseText);
    }
  })
});
