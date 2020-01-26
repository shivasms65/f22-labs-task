class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  has_many :answers

  validates :description, presence: true

  scope :user_attended_questions, ->(user_id) { Question.left_outer_joins(:answers).where(answers: { user_id: user_id }) }
  scope :user_answered_questions, ->(user_id) { user_attended_questions(user_id).where.not(answers: { option_id: nil }) }
  scope :user_skipped_questions, ->(user_id) { user_attended_questions(user_id).where(answers: { option_id: nil }) }

  enum complexity: [:easy, :medium, :hard]
end
