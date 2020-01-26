class User < ApplicationRecord
  has_many :answers

  validates :email, presence: true, uniqueness: true

  def questions

  end

  def skipped_questions
    answers.where(option_id: nil)
  end
end
