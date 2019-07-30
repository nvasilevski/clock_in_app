require 'rails_helper'

describe User do
  describe '#status' do
    let!(:user) { User.create(login: 'test_login', fullname: 'test_fullname') }

    context 'when user have an event' do
      let!(:event) { Events::ClockEvent.create(user: user, event_type: event_type) }
      let(:event_type) { EventTypes::CLOCK_IN }

      it 'returns status of the latest event' do
        expect(user.status).to eq(event_type)
      end
    end



    context 'when user has no events' do
      let(:event_type) { EventTypes::CLOCK_OUT }
      
      it 'returns default event type' do
        expect(user.status).to eq(event_type)
      end
    end
  end
  
  describe '#is_admin?' do
    context 'when user is admin' do
      let(:user) { User.new(login: 'admin', fullname: 'I am an admin') }

      it 'returns true' do
        expect(user.is_admin?).to be_truthy
      end
    end

    context 'when user is regular visitor' do
      let(:user) { User.new(login: 'not_admin', fullname: 'I am not an admin') }

      it 'returns false' do
        expect(user.is_admin?).to be_falsey
      end
    end
  end
end