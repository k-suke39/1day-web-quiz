class Question < ApplicationRecord
    has_many :answers, dependent: :destroy

    #ユーザーが解答した質問だけ表示するようにする
    def self.display_questions(id)
        # ログインユーザーのIDを取得
        last_answer = Answer.where(user_id: id).order(created_at: :desc).first # 最後に解答した問題を取得
      
        if last_answer
          # 最後に解答した問題の次の問題を取得
          question = Question.where('id > ?', last_answer.question_id).first
        else
          # 新規登録時は1問目を出力
          question = Question.first
        end
    end

    def self.answered_question(user_id)
      Question.joins(:answers).where(answers: { user_id: user_id })
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
