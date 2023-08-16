class QuestionsController < ApplicationController
  before_action :is_answerd?, only: [:show]
  def index
    @questions = Question.answered_question(current_user.id)
  end

  def show
    @question = Question.find_by(id:  params[:id])
    @answers = @question.answers
  end
    
  def new
    @question = current_user.last_answered_question
    @answer = Answer.new
    @last_answer = current_user.last_answer
    @passed_24_hours = current_user.passed_24_hours?
    puts "@passed_24_hoursデバッグ中: #{@passed_24_hours}"
  end

  private

  def is_answerd?
    answer = Answer.where(question_id: params[:id], user_id: current_user.id)
    redirect_to answers_path unless answer
  end
end