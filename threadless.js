var Threadless = {
  start: function($){

    $('.activity-stream').on('click', 'a', function(){
       $('.notifications-list').toggle();
    });

    var template = Handlebars.compile($('#notification-entries').html());
    function loadNotifications(data) {
      console.log('Notifications: ' + data);
      $('<ul/>', {'class': 'notifications', html: template(data)}).appendTo('.notifications-list');
    }

    $.get('http://localhost:3000/notifications', loadNotifications);
  }
};
