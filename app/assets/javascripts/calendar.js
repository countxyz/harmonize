  $(document).ready(function() {
  
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      editable: true,
      events: [
        {
          title: 'Beneke: To Production',
          start: new Date(y, m, 3)
        },
        {
          title: 'Finish and Refactor Beneke',
          start: new Date(y, m, d-5),
          end: new Date(y, m, d-2)
        },
        {
          id: 999,
          title: 'Call Art Vandelay',
          start: new Date(y, m, d-3, 16, 0),
          allDay: false
        },
        {
          id: 999,
          title: 'Start Burr Project',
          start: new Date(y, m, d+4),
          allDay: false
        },
        {
          title: 'GA Meetup',
          start: new Date(y, m, d, 19),
          allDay: false
        },
        {
          title: 'Beneke Deadline',
          start: new Date(y, m, d+1, 19, 0),
          end: new Date(y, m, d+1, 22, 30),
          allDay: false
        }
      ]
    });
    
  });