var app = require('express')();
var bodyParser = require('body-parser');

app.use(bodyParser.json());

app.use(function(req, res, next) {
  res.set('Access-Control-Allow-Origin', '*');
  res.set('Access-Control-Allow-Methods', 'POST, DELETE');

  /*
   *  According to http://www.w3.org/TR/cors/#preflight-request
   *  "If a header field name is a _simple header_ and is not Content-Type, it is not required to be listed."
   *  This is why the 'Accept' header we are sending from the client side does not need to be listed.
   */
  res.set('Access-Control-Allow-Headers', 'Content-Type');

  /*
   * Might want to cache this to prevent unnecessary calls.
   */
  //res.set('Access-Control-Max-Age', 1728000);

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

app.listen(3001, function(){
  console.log('Server listening...\n');
});


