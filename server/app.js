var app = require('express')();
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded());

app.use(function(req, res, next) {
  res.set('Access-Control-Allow-Origin', '*');
  res.set('Access-Control-Allow-Methods', 'HEAD, OPTIONS, GET, POST, PUT, DELETE');

  res.set('Access-Control-Allow-Headers', 'Authorization, Content-Type');
  res.set('Access-Control-Max-Age', 1728000);
  next();
});

app.use(function(req, res, next){
  console.log('%s %s', req.method, req.url);
  next();
});

var notifications = app.route('/notifications');

notifications.get(function(req, res) {

  var result = [
    { linkDesc: 'Submit a design for a zip hoodie', img: 'http://placehold.it/91x52' },
    { linkDesc: 'Design a unique character', img: 'http://placehold.it/91x52' },
    { linkDesc: 'Submit a design for a pullover hoodie', img: 'http://placehold.it/91x52' }
  ]

  return res.json(200, { result: result });
});

var designVotes = app.route('/designs/:id/votes');

designVotes.post(function(req, res) {
  return res.json(201, { score: req.param('score') });
});

app.listen(3000, function(){
  console.log('Server listening...\n');
});


