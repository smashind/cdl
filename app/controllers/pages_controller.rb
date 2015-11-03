class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:success]
	layout false, only: [:cdl_optin, :cdl_practice_test, :cdl_thank_you]

  def cdl_study_guides_and_practice_tests
    @states = [ "Alaska","Alabama","Arkansas","Arizona","California","Colorado","Connecticut","District of Columbia",
                "Delaware","Florida","Georgia","Hawaii","Iowa","Idaho","Illinois","Indiana","Kansas","Kentucky","Louisiana",
                "Massachusetts","Maryland","Maine","Michigan","Minnesota","Missouri","Mississippi","Montana","North Carolina",
                "North Dakota","Nebraska","New Hampshire","New Jersey","New Mexico","Nevada","New York","Ohio","Oklahoma",
                "Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Virginia",
                "Vermont","Washington","Wisconsin","West Virginia","Wyoming"]
  end

  def cdl_optin
  end

  def cdl_practice_test
  end

  def cdl_thank_you
  end

	def success
	end
end