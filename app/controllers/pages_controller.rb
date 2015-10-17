class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success]
	layout false, only: [:cdl_optin]

  def cdl_option
  end
  
	def success
	end
end