class ForumBoard < ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy
	has_many :forum_posts, through: :forum_topics
end
