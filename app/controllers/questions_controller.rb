class QuestionsController < ApplicationController
  def new
    @question = Question.display_question
    @answer = Answer.new
  end
end
