class Exam < ApplicationRecord
  include BranchConcerns

  has_many :subjects
  has_many :topics, through: :subjects
  has_many :chapters, through: :topics
  has_many :questions, through: :chapters

  validates :name, presence: true
end
