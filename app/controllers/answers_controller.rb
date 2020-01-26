class AnswersController < ApplicationController
  def create
    @answer = Answer.create_user_answer(answer_params)
    render json: @answer
  end

  private

  def answer_params
    params.permit(:user_id, :option_id, :question_id)
  end
end
