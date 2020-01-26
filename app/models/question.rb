class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  has_many :answers

  validates :description, presence: true

  enum complexity: [:easy, :medium, :hard]
end
