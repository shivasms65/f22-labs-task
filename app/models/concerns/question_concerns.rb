module QuestionConcerns
  extend ActiveSupport::Concern

  def self.questions_by_branch(param)
    begin
      branch = get_branch(param)
      branch.unanswered_questions(param[:user_id]).select(:id, :description, :complexity)
    rescue => exception
      puts "Error While Fetching Questions", exception
      return { errors: 'Error While Fetching Questions, Provided invalid params' }
    end
  end

  def self.get_branch(param)
    param[:branch_type].singularize.capitalize.constantize.where(id: param[:branch_id]).first
  end

  def unanswered_questions(user_id)
    user = User.find_by_id(user_id)
    return Question.none unless user

    questions = self.questions.user_unseen_questions(user).order('rand()')

    if questions.blank?
      user.skipped_questions
    else
      questions
    end
  end

  def self.fetch_user_results(param)
    begin
      branch = get_branch(param)
      branch.calculate_percentage(param[:user_id])
    rescue => exception
      puts "Error While Fetching Questions", exception
      return { errors: 'Error While Fetching Questions, Provided invalid params' }
    end
  end

  def calculate_percentage(user_id)
    response = {}
    user = User.find_by_id(user_id)
    return [] unless user

    total_count = self.questions.count
    unseen_count = self.questions.user_unseen_questions(user).count
    correct_answer_count = self.questions.user_correct_answered_questions(user).count
    wrong_answer_count = self.questions.user_wrong_answered_questions(user).count
    skipped_count = self.questions.user_skipped_questions(user).count

    response[:correct_answers] = correct_answer_count.percentage_of(total_count).to_s(:percentage, precision: 2)
    response[:wrong_answers] = wrong_answer_count.percentage_of(total_count).to_s(:percentage, precision: 2)
    response[:skipped_questions] = skipped_count.percentage_of(total_count).to_s(:percentage, precision: 2)
    response[:unseen_questions] = unseen_count.percentage_of(total_count).to_s(:percentage, precision: 2)

    response
  end
end

class Numeric
  include ActionView::Helpers::NumberHelper

  def percentage_of(n)
    self != 0 ? ((self.to_f / n) * 100).round(2) : 0
  end
end