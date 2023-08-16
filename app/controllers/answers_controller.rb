class AnswersController < ApplicationController
  before_action :is_answered? only[:show]
  
  def index
    @answers = current_user.answers.includes(:question)
  end

  def show
    @answer = Answer.find_by(id: params[:id])
  end

  def new;end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to answers_path, notice: t('answers.create.success')
    else
      flash.now[:warning] = t('answers.create.failure')
      render 'questions/new',  status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

  def is_answered?
    @answer = Answer.find_by(id: params[:id])
    redirect_to answers_path unless  Answer.find_by(question_id: @answer.question.id, user_id: current_user.id)
  end
end
