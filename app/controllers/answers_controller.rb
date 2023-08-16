class AnswersController < ApplicationController
  def index
  end

  def show
    
  end

  def new

  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to questions_new_path, notice: t('user_sessions.create.success')
    else
      flash.now[:warning] = t('user_sessions.create.failure')
      render :new,  status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge(:question_id)
  end
end
