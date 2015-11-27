require 'rails_helper'

RSpec.describe AttemptsController, type: :controller do
  
  describe "POST #create" do

		context "with valid attributes and an incomplete test" do
	    it "creates the attempt" do
	    	post :create, attempt: FactoryGirl.build(:attempt).attributes
	      expect(Attempt.count).to eq(1)
	    end
	  end

	  context "with valid attributes and a complete test" do
	    it "creates the attempt" do
	    	post :create, attempt: FactoryGirl.build(:attempt, :completed).attributes
	      expect(Attempt.count).to eq(1)
	    end
	  end

	  context "with invalid attributes" do
	  	it "doesn't create the attempt" do
	  		post :create, attempt: FactoryGirl.build(:attempt, score: nil).attributes
	  		expect(Attempt.count).to eq(0)
	  	end
	  end

	end

	describe "GET #show" do

		before(:each) do
			@test = FactoryGirl.create(:test)
			@attempt = FactoryGirl.create(:attempt, place: @test.questions.last.id)
		end

		it "assigns the requested attempt to @attempt" do
			get :show, id: @attempt
			expect(assigns(:attempt)).to eq(@attempt)
		end

		it "renders the #show view" do
			user = FactoryGirl.create(:user)
			sign_in user
			get :show, id: @attempt.id
			expect(response).to render_template :show
		end
	end

	describe "PUT #update" do

		before(:each) do
			@attempt = FactoryGirl.create(:attempt)			
		end

		context "with valid attributes" do
		  it "updates the attempt" do
		  	put :update, id: @attempt, attempt: FactoryGirl.attributes_for(:attempt, score: 12)
		  	@attempt.reload
		  	expect(@attempt.score).to eq(12)
		  end
		end

		context "with invalid attributes" do
			it "doesn't update the attempt" do
				put :update, id: @attempt, attempt: FactoryGirl.attributes_for(:attempt, user_id: nil)
				@attempt.reload
				expect(@attempt.score).to_not eq(nil)
			end
		end

	end

end
