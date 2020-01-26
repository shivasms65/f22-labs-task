class Topic < ApplicationRecord
  include QuestionConcerns

  belongs_to :subject
  has_many :chapters
  has_many :questions, through: :chapters

  validates :name, presence: true
end
