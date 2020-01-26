require 'rails_helper'

RSpec.describe Subject, type: :model do
  context 'When create' do
    it 'should create subject when have name and exam' do
      exam = Exam.create(name: 'Test 1')
      subject = exam.subjects.create(name: 'Sub 1')
      expect(subject.errors.messages).to be {}
    end

    it 'should not create subject when not having name and invalid exam' do
      subject = Subject.create(name: '')
      expect(subject.errors.messages[:name]).to eq ["can't be blank"]
      expect(subject.errors.messages[:exam]).to eq ["must exist"]
    end
  end
end
