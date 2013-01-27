class Rank < ActiveRecord::Base
  attr_accessible :title, :min_posts

  has_many :users
end
