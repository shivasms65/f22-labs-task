class ResultsController < ApplicationController
  def index
    @response = QuestionConcerns.fetch_user_results(results_params)
    render json: @response
  end

  private

  def results_params
    params.permit(:user_id, :branch_type, :branch_id)
  end
end
