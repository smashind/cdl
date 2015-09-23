class Attempt < ActiveRecord::Base
  belongs_to :test, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
