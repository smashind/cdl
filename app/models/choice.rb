class Choice < ActiveRecord::Base
  belongs_to :question
  default_scope { order('id ASC') }
end
