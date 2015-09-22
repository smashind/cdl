require 'rails_helper'

RSpec.describe Choice, type: :model do
  
  subject(:choice) { FactoryGirl.build(:choice) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:answer) }
  it { is_expected.to respond_to(:is_correct) }
  it { is_expected.to respond_to(:question_id) }
end
