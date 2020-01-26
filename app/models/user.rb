class User < ApplicationRecord
  has_many :answers

  validates :email, presence: true, uniqueness: true

  def skipped_questions
    Question.where(id: answers.where(option_id: nil))
  end
end
