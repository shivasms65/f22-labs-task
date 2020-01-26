module QuestionConcerns
  extend ActiveSupport::Concern

  def self.questions_by_branch(param)
    begin
      branch = param[:branch_type].singularize.capitalize.constantize.where(id: param[:branch_id]).first
      branch.unanswered_questions(param[:user_id]).select(:id, :description, :complexity)
    rescue => exception
      puts "Error While Fetching Questions", exception
      return { errors: 'Error While Fetching Questions, Provided invalid params' }
    end
  end

  def unanswered_questions(user_id)
    user = User.find_by_id(user_id)
    return Question.none unless user

    questions = self.questions.where.not(id: user.answers.pluck(:question_id)).order('rand()')

    if questions.blank?
      user.skipped_questions
    else
      questions
    end
  end
end