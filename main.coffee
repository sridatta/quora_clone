{EventEmitter} = require('events')
Question = require './question.js'
Answer = require './answer.js'

class User
  constructor:(@socket)->
    @id = socket.sessionId
    @questions = []
    GlobalEvents.on 'question_added', (questionId, questionText)->
      @socket.emit 'question_added', questionId, questionText
    
    @api = 
      question_added : @addQuestion
      answer_added : @addAnswer
      answer_upvote : @upvoteAnswer
      question_followed : @followQuestion

  addQuestion:(questionText)->
    questionId = createUniqueId()
    questions[questionId] = new Question questionText
    @followQuestion questionId
    GlobalEvents.emit 'question_added', questionId, questionText

  addAnswer:(questionId, answerText)->
    answerId = createUniqueId()
    answers[answerId] = answer = new Answer answerText
    question[questionId].addAnswer answer

  upvoteAnswer:(answerId)->
    answers[answerId].upvote(@id)

  followQuestion:(questionId)->
    @questions.push questionId
    question = questions[questionId]
    question.on 'answer_added', (answer)->
      @socket.emit 'answer_added', questionId, answer
    question.on 'answer_upvoted', (count)->
      @socket.emit 'answer_upvoted', count



questions = {}
answers = {}

uniqueId = 0
createUniqueId = ->
  uniqueId++


class GlobalEvents extends EventEmitter
  
GlobalEvents = new GlobalEvents


module.exports = {User}