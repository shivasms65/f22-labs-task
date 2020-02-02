class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers

  validates :email, presence: true, uniqueness: true

  scope :ranks, -> { joins(answers: [question: [chapter: [:topic]]]).select("users.id as id, count('questions.*') as correct_answers").where.not(answers: { option_id: nil }).where("questions.valid_option_id = answers.option_id").group('users.id').order('correct_answers desc') }

  ['skipped', 'attended', 'answered', 'correct_answered', 'wrong_answered'].each do |method|
    define_method("#{method}_questions") do
      Question.send("user_#{method}_questions", self.id)
    end
  end

  def rank
    User.ranks.index(self) ? (User.ranks.index(self) + 1) : "Not Yet Attendted Any Questions"
  end

  def good_at_topic
    Topic.by_user_correct_answers(self).first
  end

  def bad_at_topic
    Topic.by_user_wrong_answers(self).first
  end

  def results
    results = {}
    results[:total_number_of_questions_attempted] = attended_questions.count
    results[:total_number_of_correct_answers] = correct_answered_questions.count
    results[:total_number_of_wrong_answers] = wrong_answered_questions.count
    results[:topic_with_most_correct_answers] = good_at_topic
    results[:topic_with_most_wrong_answers] = bad_at_topic
    results[:rank] = rank
    results
  end
  
  def admin?
    is_admin
  end
end
