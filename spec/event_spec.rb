require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'Event', type: :model do
  it 'is valid with a title and a date' do
    user = User.create(user_name: 'Roses', email: 'roses@mail.com')
    event = user.created_events.build(title: 'Event1', date: '12/05/2022')
    expect(event).to be_valid
  end

  it 'is not valid with just a title without date' do
    user = User.create(user_name: 'Roses', email: 'roses@mail.com')
    event = user.created_events.build(title: 'Event2')
    expect(event).to_not be_valid
  end

  it 'is not valid with just a date without title' do
    user = User.create(user_name: 'Roses', email: 'roses@mail.com')
    event = user.created_events.build(date: '12/05/2022')
    expect(event).to_not be_valid
  end

  it 'should be associated with a user' do
    no_user_event = Event.new(creator_id: nil)
    no_user_event.should_not be_valid
  end
end

describe 'associations' do
  it 'should belong to a creator' do
    event = Event.reflect_on_association(:creator)
    expect(event.macro).to eql(:belongs_to)
  end

  it 'should have many attendees' do
    event = Event.reflect_on_association(:attendees)
    expect(event.macro).to eql(:has_many)
  end
end
