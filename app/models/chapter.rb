class Chapter < ApplicationRecord
  include QuestionConcerns

  belongs_to :topic
  has_many :questions

  validates :name, presence: true
end
