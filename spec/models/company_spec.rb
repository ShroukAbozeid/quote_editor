require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:users).dependent(:destroy) }
  it { is_expected.to have_many(:quotes).dependent(:destroy) }
end
