require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When create' do
    it 'should create if have valid name and email' do
      user = User.create(name: 'Test 1', email: 'test@gmail.com')
      expect(user.errors.messages).to be {}
    end

    it 'should not create user when not having email' do
      invalid_user = User.create(name: 'Test 2', email: '')
      expect(invalid_user.errors.messages[:email][0]).to eq "can't be blank"
    end
  end
end
