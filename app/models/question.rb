class Question < ApplicationRecord
    def display_question
        user_id = current_user.id # ログインユーザーのIDを取得
        last_answer = Answer.where(user_id: user_id).order(created_at: :desc).first # 最後に解答した問題を取得
      
        if last_answer
          # 最後に解答した問題の次の問題を取得
          question = Question.where('id > ?', last_answer.question_id).first
        else
          # 新規登録時は1問目を出力
          question = Question.first
        end
    end
end
