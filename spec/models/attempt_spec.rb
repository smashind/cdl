require 'rails_helper'

RSpec.describe Attempt, type: :model do
  
  subject(:attempt) { FactoryGirl.build(:attempt) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:test_id) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:score) }
  it { is_expected.to respond_to(:incorrect) }
  it { is_expected.to respond_to(:place) }
  it { is_expected.to respond_to(:completed) }

  it "is invalid without a test_id" do 
  	attempt.test_id = nil
  	expect(attempt).to_not be_valid
  end

  it "is invalid without a user_id" do 
  	attempt.user_id = nil
  	expect(attempt).to_not be_valid
  end

  it "is invalid without a score" do 
  	attempt.score = nil
  	expect(attempt).to_not be_valid
  end
end
