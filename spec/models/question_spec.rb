require 'rails_helper'

RSpec.describe Question, type: :model do
  
  subject(:question) { FactoryGirl.build(:question) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:text) }
  it { is_expected.to respond_to(:test_id) }

  describe "when text is not valid" do 
  	before { question.text = nil }
  	it { is_expected.to_not be_valid }
  end
end
