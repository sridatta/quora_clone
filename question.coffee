{EventEmitter} = require('events')
Answer = require './answer.js'

class Question extends EventEmitter
  constructor:(@text)->
    @answers = []
  
  addAnswer:(answer)->
    @answers.push answer
    @emit 'answer_added', answer
    answer.on 'upvoted', (count)=>
      @emit 'answer_upvoted', count


module.exports = Question