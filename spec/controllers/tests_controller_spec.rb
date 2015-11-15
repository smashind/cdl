require 'rails_helper'

RSpec.describe TestsController, type: :controller do

	describe "POST #create" do
		context "with valid attributes" do
	    it "creates the test" do
	    	post :create, test: FactoryGirl.create(:test).attributes 
	      expect(Test.count).to eq(1)
	    end
	  end
  end

end