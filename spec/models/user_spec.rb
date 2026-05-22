require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:company) }

  describe 'name' do
    let(:user) { build(:user, email: 'accountant@kpmg.com') }

    it 'returns the first part of the email' do
      expect(user.name).to eq('Accountant')
    end
  end
end
