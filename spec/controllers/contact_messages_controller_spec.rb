require 'rails_helper'

RSpec.describe ContactMessagesController, type: :controller do

  describe "POST #create" do
    subject { ContactMessage.new(name: "John", email: "john@example.com", message: "Hello there.") }

    it "returns http success" do
      expect(response).to be_success
    end
  end

end
