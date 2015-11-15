require 'rails_helper'

RSpec.describe ContactMessage, type: :model do
  subject(:message) { FactoryGirl.build(:contact_message) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:message) }

  it "is invalid without a name" do
  	message.name = nil
  	expect(message).to_not be_valid
  end

  it "is invalid without an email" do 
  	message.email = nil
  	expect(message).to_not be_valid
  end

  it "is invalid without a message" do
  	message.message = nil
  	expect(message).to_not be_valid
  end
end
