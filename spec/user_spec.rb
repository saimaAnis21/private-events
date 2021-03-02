require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'User', type: :model do
  it 'is valid with a username and an email' do
    user = User.create(user_name: 'Roses', email: 'roses@mail.com')
    expect(user).to be_valid
  end

  it 'is not valid with only username' do
    user = User.create(user_name: 'Roses')
    expect(user).to_not be_valid
  end

  it 'is not valid with only email' do
    user = User.create(email: 'roses@mail.com')
    expect(user).to_not be_valid
  end
end

describe 'associations' do
  it 'should have many events' do
    t = User.reflect_on_association(:created_events)
    expect(t.macro).to eq(:has_many)
  end

  it 'should attend many events' do
    t = User.reflect_on_association(:attended_events)
    expect(t.macro).to eq(:has_many)
  end
end

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(user_name: 'user1', email: 'user1@mail.com')
  end

  before(:each) do
    @event = @user.created_events.build(title: 'Event1', date: '10/10/2022')
    @event.save
  end

  scenario 'when a user clicks the Signin button' do
    visit root_path
    click_on 'Sign In'
    fill_in 'username', with: 'user1'
    fill_in 'email', with: 'user1@mail.com'
    click_on 'Submit'
    click_on 'All Events'
    expect(current_path).to eql('/events/index')
    sleep(10)
  end
end
