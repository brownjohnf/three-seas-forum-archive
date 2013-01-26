class Forum < ActiveRecord::Base
  attr_accessible :name

  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics

  default_scope :order => 'name ASC'
end
