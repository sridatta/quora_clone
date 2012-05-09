{User} = require './main.js'

io = (require 'socket.io').listen(3000)

io.sockets.on 'connection', (socket)->
  user = new User socket
  socket.on event, route for event, route of user.api