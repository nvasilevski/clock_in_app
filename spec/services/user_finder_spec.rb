require 'rails_helper'

describe UserFinder do
  describe '.call' do
    let!(:user) { User.create(login: login, fullname: fullname) }
    let(:login) { 'user_login' }
    let(:fullname) { 'user_fullname' }

    context 'when searching by login' do
      it 'returns user by login' do
        expect(described_class.call(login)).to eq(user)
      end

      context 'when login is wrong' do
        let(:wrong_login) { 'missing_login' }

        it 'does not return user' do
          expect(described_class.call(wrong_login)).to eq(nil)
        end
      end
    end

    context 'when searching by fullname' do
      it 'returns user' do
        expect(described_class.call(fullname)).to eq(user)
      end
    end
  end
end