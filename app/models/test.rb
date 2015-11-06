class Test < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :code
	validate :questions_count
	validate :choices_count
	has_many :questions, dependent: :destroy
	has_many :choices, through: :questions
	has_many :attempts, dependent: :destroy
	accepts_nested_attributes_for :questions, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true
  accepts_nested_attributes_for :choices

  def questions_count
  	if self.questions.length == 0
  		self.errors[:base] << "A test must have at least one question."
  	end
  end

  def choices_count
  	self.questions.each do |question|
  		if question.choices.length < 3
  			self.errors[:base] << "Each question must have 3 choices."
  		end
  	end
  end
end