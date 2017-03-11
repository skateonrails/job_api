require 'rails_helper'

RSpec.describe User, type: :model do
  let(:api_key) { nil }
  let(:user) { User.create!(api_key: api_key) }

  describe '#create' do
    context 'api_key not set' do
      it 'should create a api_key' do
        expect(user.api_key).to be_present
      end
    end

    context 'api_key set' do
      let(:api_key) { SecureRandom.base64.tr('+/=', 'Qrt') }

      it 'should use the api_key set by parameter' do
        expect(user.api_key).to eq(api_key)
      end
    end
  end
end
