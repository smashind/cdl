require 'rails_helper'

RSpec.describe TestsController, type: :controller do

	describe "GET #index" do

		before(:each) do
			@test = FactoryGirl.create(:test)
		end

		context "as an admin user" do 
			it "shows all tests" do
				admin = FactoryGirl.create(:user, :admin)
				sign_in admin
				get :index
				expect(assigns(:tests)).to eq([@test])
			end
		end

		context "as a regular user" do
			it "doesn't show all tests" do
				user = FactoryGirl.create(:user)
				sign_in user
				expect(assigns(:tests)).to_not eq([@test])
			end
    end

	end

	describe "POST #create" do

		context "with valid attributes" do
	    it "creates the test" do
	    	post :create, test: FactoryGirl.create(:test).attributes 
	      expect(Test.count).to eq(1)
	    end
	  end

	  context "with invalid attributes" do
	  	it "doesn't create the test" do
	  		post :create, test: {name: "Test", code: 2}
	  		expect(Test.count).to eq(0)
	  	end
	  end

  end

  describe "GET #show" do

  	before(:each) do
  	  @test = FactoryGirl.create(:test)
  	end

  	it "assigns the requested test to @test" do
  		get :show, id: @test
  		expect(assigns(:test)).to eq(@test)
  	end

  	it "renders the #show view" do
  		user = FactoryGirl.create(:user)
  		sign_in user
  		get :show, id: @test.id
  		expect(response).to render_template :show
  	end

  end

  describe "PUT #update" do

  	before(:each) do
  	  @test = FactoryGirl.create(:test)
  	end

  	context "with valid attributes" do
  		it "updates the test" do
  			put :update, id: @test, test: FactoryGirl.attributes_for(:test, name: "Updated test")
  			@test.reload
  			expect(@test.name).to eq("Updated test")
  		end
  	end

  	context "with invalid attributes" do
  		it "does not update the test" do
  			put :update, id: @test, test: FactoryGirl.attributes_for(:test, name: nil)
  			@test.reload
  			expect(@test.name).to_not eq(nil)
  		end
  	end
  end

  describe "DELETE #destroy" do

  	before(:each) do
  		@test = FactoryGirl.create(:test)
  	end

  	it "destroys the test" do
  		expect{ delete :destroy, id: @test }.to change(Test, :count).by(-1)
  	end

  	it "redirects to tests#index" do
  		delete :destroy, id: @test
  		expect(response).to redirect_to tests_url
  	end

  end

end