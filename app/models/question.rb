class Question < ActiveRecord::Base
  belongs_to :test
  validates_presence_of :text
  validates_presence_of :test_id
	has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:answer].blank? }, allow_destroy: true

  def next
  	self.class.where("test_id IS ?", self.test).where("id > ?", id).first
  end

  def previous
  	self.class.where("test_id IS ?", self.test).where("id < ?", id).last
  end

end
