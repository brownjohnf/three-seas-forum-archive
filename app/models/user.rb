class User < ActiveRecord::Base
  attr_accessible :created_at, :username, :website

  belongs_to :rank

  has_many :posts

  default_scope :order => 'created_at ASC'
end
