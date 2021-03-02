require 'rails_helper'

RSpec.configure do |c|
    c.use_transactional_examples = false
    c.order = 'defined'
end

RSpec.describe 'User', type: :model do
    it 'is valid with a username and an email' do
      user = User.create(user_name: 'Roses',email:'roses@mail.com')
      expect(user).to be_valid
    end

    it 'is not valid with only username' do
      user = User.create(user_name: 'Roses')
      expect(user).to_not be_valid
    end

    
end
