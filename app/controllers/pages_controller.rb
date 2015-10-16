class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success_itca]

	def success_itca
	end
end
