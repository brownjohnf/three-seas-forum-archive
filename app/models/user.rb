class User < ActiveRecord::Base
  attr_accessible :created_at, :username, :website

  has_many :posts
end
