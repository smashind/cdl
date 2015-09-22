require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject (:user) { FactoryGirl.build :user }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }

end
