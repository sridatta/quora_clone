quora_clone
===========

http://192.168.1.111:3000

client-side:
socket.emit-
  question_added (questionText)
  answer_added (questionId, answerText)
  answer_upvote (answerId)
  question_followed (questionId)
  
socket.on-
  question_added (questionId, questionText)
  answer_added (questionId, answer)
  answer_upvoted (answerId)