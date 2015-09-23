class Test < ActiveRecord::Base
	validates_presence_of :name
	has_many :questions, dependent: :destroy
	has_many :choices, through: :questions
	has_many :attempts
	accepts_nested_attributes_for :questions, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true
  accepts_nested_attributes_for :choices
end
