class Chapter < ApplicationRecord
  include BranchConcerns

  belongs_to :topic
  has_many :questions

  validates :name, presence: true
end
