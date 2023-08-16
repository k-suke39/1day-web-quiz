class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :answers

  def last_answer
    last_answer = self.answers.order(created_at: :desc).first
  end

  def last_answered_question
    last_answer = self.answers.order(created_at: :desc).first
    if last_answer
      Question.where('id > ?', last_answer.question_id).first
    else
      Question.first
    end
  end

  def passed_24_hours?
    #回答したかつ、24時間継続している場合
    last_answer = self.answers.order(created_at: :desc).first
    if last_answer && last_answer.created_at < 24.hours.ago
      return true
    end
    #初期登録時
    if last_answer == nil
      return true
    end
      return false
  end
end
