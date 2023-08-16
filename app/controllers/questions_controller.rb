class QuestionsController < ApplicationController
  def index
    @questions = Question.answered_question(current_user.id)
  end

  def show
    @question = Question.find_by(id:  params[:id])
    @answers = @question.answers
  end
    
  def new
    @question = Question.display_questions(current_user.id)
    @answer = Answer.new
    @next_question_time = @question.next_question_time
  end
end
