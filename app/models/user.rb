class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :answers

  def answered_questions
    Question.joins(:answers).where(answers: { user_id: id })
  end

  def next_question_time
    last_answer = answers.order(created_at: :desc).first
    if last_answer && last_answer.created_at > 24.hours.ago
      last_answer.created_at + 24.hours
    else
      Time.current
    end
  end
end
