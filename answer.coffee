{EventEmitter} = require('events')

class Answer extends EventEmitter
  constructor:(@text)->
    @votes = {}
    @voteCount = 0

  upvote:(userId)->
    unless @votes[userId]?
      @votes[userId] = 'up'
      @voteCount++
      @emit 'upvoted', @voteCount

module.exports = Answer