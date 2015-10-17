class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success]
	layout false, only: [:cdl_optin, :cdl_thank_you]

  def cdl_option
  end

  def cdl_thank_you
  end

	def success
	end
end