class QuestionsController < ApplicationController
  def index
    @questions = current_user.answered_question
  end
    
  def new
    @question = Question.display_question(current_user.id)
    @answer = Answer.new
    @next_question_time = current_user.next_question_time
  end
end
