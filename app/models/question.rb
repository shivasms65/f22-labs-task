class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  has_many :answers

  validates :description, presence: true

  scope :user_unseen_questions, ->(user) { where.not(id: user.answers.pluck(:question_id)) }
  scope :user_attended_questions, ->(user) { includes(:answers).where(answers: { user_id: user }) }
  scope :user_answered_questions, ->(user) { user_attended_questions(user).where.not(answers: { option_id: nil }) }
  scope :user_skipped_questions, ->(user) { user_attended_questions(user).where(answers: { option_id: nil }) }
  scope :user_correct_answered_questions, ->(user) { user_answered_questions(user).where("questions.valid_option_id = answers.option_id") }
  scope :user_wrong_answered_questions, ->(user) { user_answered_questions(user).where("questions.valid_option_id != answers.option_id") }

  enum complexity: [:easy, :medium, :hard]
end
