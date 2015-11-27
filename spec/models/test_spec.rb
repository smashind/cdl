require 'rails_helper'

RSpec.describe Test, type: :model do
  
  subject(:test) { FactoryGirl.create(:test) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:code) }

  describe "when name is not present" do
  	before { test.name = nil }
  	it { is_expected.to_not be_valid }
  end

  describe "when code is not present" do
  	before { test.code = nil }
  	it { is_expected.to_not be_valid }
  end

  it "is invalid when there are no questions" do
  	invalid_test = Test.new(name: "Test name", code: 1)
  	invalid_test.valid?
  	expect(invalid_test.errors[:base]).to eq(["A test must have at least one question."])
  end

  it "is invalid when there are no choices" do
  	invalid_test = Test.new(name: "Test name", code: 32, :questions_attributes => { 0 => { text: "Question" }})
  	invalid_test.valid?
  	expect(invalid_test.errors[:base]).to eq(["Each question must have 3 choices."])
  end 
end