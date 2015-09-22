require 'rails_helper'

RSpec.describe Test, type: :model do
  
  subject(:test) { FactoryGirl.build(:test) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }

  describe "when name is not present" do
  	before { test.name = nil }
  	it { is_expected.to_not be_valid }
  end
end