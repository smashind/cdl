class Attempt < ActiveRecord::Base
  belongs_to :test
  belongs_to :user

  validates_presence_of [:test_id, :user_id, :score, :incorrect]
end
