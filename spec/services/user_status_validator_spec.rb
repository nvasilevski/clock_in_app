require 'rails_helper'

describe UserStatusValidator do
  describe '.can_create_event_for_user?' do
    let(:user) { User.new(fullname: 'test_user', login: 'test_user') }

    context 'when event can be applied for the user' do
      let(:event_type) { EventTypes::CLOCK_IN }

      it 'returns true' do
        expect(described_class.can_create_event_for_user?(user, event_type)).to be_truthy
      end
    end

    context 'when event can not be applied for the user' do
      let(:event_type) { EventTypes::CLOCK_OUT }

      it 'returns false' do
        expect(described_class.can_create_event_for_user?(user, event_type)).to be_falsey
      end
    end
  end
end
