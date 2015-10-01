class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success, :success_premium, :success_ultimate]
	
  def index
  end

  def order
  end

  def success
  end

  def success_premium
  end

  def success_ultimate
  end
end
