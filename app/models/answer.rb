class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option, optional: true

  validate :verify_answer_option

  def self.create_user_answer(param)
    answer = Answer.where(user_id: param[:user_id], question_id: param[:question_id]).first_or_initialize
    answer.option_id = param[:option_id]
    if answer.save
      return answer
    else
      return answer.errors
    end
  end

  private

  def verify_answer_option
    if self.option
      provided_option = self.question.options.where(id: option).first
      errors.add(:option_id, message: "Invalid Option for this Question") if provided_option.blank?
    end

    if !self.new_record? && !self.option_id_was.blank?
      errors.add(:question_id, message: "Question Already Answered")
    end
  end
end
