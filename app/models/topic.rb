class Topic < ActiveRecord::Base
  attr_accessible :title, :topic_last_post_time

  belongs_to :forum

  has_many :posts

  default_scope :order => 'topic_last_post_time DESC'
end
