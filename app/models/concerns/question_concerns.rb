module QuestionConcerns
  extend ActiveSupport::Concern

  def self.questions_by_branch(param)
    begin
      branch = param[:branch_type].singularize.capitalize.constantize.where(id: param[:branch_id]).first
      branch.unanswered_questions(param[:user_id]).order('rand()')
    rescue => exception
      puts "Error While Fetching Questions", exception
    end
  end

  def unanswered_questions(user_id)
    user = User.find_by_id(user_id)
    return [] unless user

    questions = self.questions.where.not(id: user.answers.ids)

    if questions.blank?
      user.skipped_questions
    end
  end
end