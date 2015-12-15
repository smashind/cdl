class ForumTopic < ActiveRecord::Base
  belongs_to :forum_board
  belongs_to :user
  has_many :forum_posts, dependent: :destroy
end
