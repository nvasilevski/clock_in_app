require 'rails_helper'

describe User do
  describe '#status' do
    let!(:user) { User.create(login: 'test_login', fullname: 'test_fullname') }
    let!(:event) { Events::ClockEvent.create(user: user, event_type: event_type) }
    let(:event_type) { EventTypes::CLOCK_IN }

    it 'returns status of the latest event' do
      expect(user.status).to eq(event_type)
    end
  end
end