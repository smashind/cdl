class Test < ActiveRecord::Base
	validates_presence_of :name
	has_many :questions, dependent: :destroy
	accepts_nested_attributes_for :questions, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true
end
