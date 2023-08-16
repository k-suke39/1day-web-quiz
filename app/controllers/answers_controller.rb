class AnswersController < ApplicationController
  def index
  end

  def show
    
  end

  def new

  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to questions_path, notice: t('answers.create.success')
    else
      flash.now[:warning] = t('answers.create.failure')
      render 'questions/new',  status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
