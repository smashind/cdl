class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success]

	def success
	end
end