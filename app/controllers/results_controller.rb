class ResultsController < ApplicationController
  def index
    @response = User.fetch_user_results(params[:user_id])
    render json: @response
  end
end
