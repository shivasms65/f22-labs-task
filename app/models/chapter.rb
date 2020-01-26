class Chapter < ApplicationRecord
  belongs_to :topic
  has_many :questions

  validates :name, presence: true
end
