// Generated by CoffeeScript 1.3.1
(function() {
  var User, io;

  User = require('./main.js').User;

  io = (require('socket.io')).listen(3000);

  io.sockets.on('connection', function(socket) {
    var event, route, user, _ref, _results;
    user = new User(socket);
    _ref = user.api;
    _results = [];
    for (event in _ref) {
      route = _ref[event];
      _results.push(socket.on(event, route));
    }
    return _results;
  });

}).call(this);
