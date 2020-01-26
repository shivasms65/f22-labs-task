require 'rails_helper'

RSpec.describe Exam, type: :model do
  context 'When create' do
    it 'should create when have name' do
      exam = Exam.create(name: 'Test 1')
      expect(exam.errors.messages).to be {}
    end

    it 'should not create exam when not having name' do
      exam = Exam.create(name: '')
      expect(exam.errors.messages[:name]).to eq ["can't be blank"]
    end
  end
end
