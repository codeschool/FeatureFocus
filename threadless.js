var Threadless = {
  start: function($){

    $('.activity-stream').on('click', 'a', function(){
       $('.notifications-list').toggle();
    });

    var template = Handlebars.compile($('#notification-entries').html());
    function loadNotifications(data) {
      $('<ul/>', {'class': 'notifications', html: template(data)}).
        appendTo('.notifications-list');
    }

    $.get('http://localhost:3001/notifications', loadNotifications);

    $('.points').on('click', 'li', function(e){
      var target = $(e.target);
      var designId = target.closest('ul').data('design-id');
      var score = target.closest('li').find('a').text();

      $.post('http://localhost:3001/designs/' + designId + '/votes', { score: score },
             voteCast);
    });

    function voteCast() {
      console.log('done!')
    }
  }
};
