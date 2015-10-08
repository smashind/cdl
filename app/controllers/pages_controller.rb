class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success, :success_premium, :success_ultimate]
	
  def index
  end

  def order
  end

  def class_a_endorsement
  end

  def class_b_endorsement
  end

  def double_triple_endorsement
  end

  def hazardous_materials_endorsement
  end

  def passenger_vehicle_endorsement
  end

  def school_bus_endorsement
  end

  def tank_vehicle_endorsement
  end

  def success
  end

  def success_premium
  end

  def success_ultimate
  end
end
