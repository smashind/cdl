class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success, :success_premium, :success_ultimate]

end
