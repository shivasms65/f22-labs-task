class User < ApplicationRecord
  has_many :answers

  validates :email, presence: true, uniqueness: true

  def skipped_questions
    Question.user_skipped_questions(id)
  end

  def answered_questions
    Question.user_answered_questions(id)
  end

  def self.fetch_user_results(user_id)
    user = User.find_by(id: user_id)
    return { errors: { user_id: 'Invalid User' } } if user.blank?

  end
end
