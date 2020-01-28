class Topic < ApplicationRecord
  include BranchConcerns

  belongs_to :subject
  has_many :chapters
  has_many :questions, through: :chapters


  scope :by_user_results, ->(user) { joins(chapters: [questions: [answers: :user]]).where(answers: { user_id: user }) }
  scope :by_user_correct_answers, ->(user) { by_user_results(user).where("questions.valid_option_id = answers.option_id").select("topics.*, count('questions.*') as no_of_correct_answers").group('topics.id').order('no_of_correct_answers desc') }
  scope :by_user_wrong_answers, ->(user) { by_user_results(user).where("questions.valid_option_id != answers.option_id").select("topics.*, count('questions.*') as no_of_wrong_answers").group('topics.id').order('no_of_wrong_answers desc') }

  validates :name, presence: true
end
