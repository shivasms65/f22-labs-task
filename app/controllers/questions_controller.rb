class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = BranchConcerns.questions_by_branch(question_params)
    render json: @questions.to_json(:include => :options)
  end

  private

  def question_params
    params.permit(:user_id, :branch_type, :branch_id)
  end
end
