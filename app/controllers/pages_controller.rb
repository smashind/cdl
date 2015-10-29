class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success]
	layout false, only: [:cdl_optin, :cdl_practice_test, :cdl_thank_you]

  def cdl_option
  end

  def cdl_practice_test
  end

  def cdl_thank_you
  end

	def success
	end
end