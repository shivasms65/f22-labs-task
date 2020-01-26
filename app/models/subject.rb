class Subject < ApplicationRecord
  belongs_to :exam
  has_many :topics
  has_many :chapters, through: :topics
  has_many :questions, through: :chapters

  validates :name, presence: true
end
