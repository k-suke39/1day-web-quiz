class QuestionsController < ApplicationController
  def new
    @question = Question.display_question(current_user.id)
    @answer = Answer.new
  end
end
