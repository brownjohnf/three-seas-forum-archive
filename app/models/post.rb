class Post < ActiveRecord::Base
  attr_accessible :subject, :text

  belongs_to :user
  belongs_to :topic

  delegate :forum, :to => :topic

  default_scope :order => 'created_at ASC'

  def author
    post_username.blank? ? user.username : post_username
  end

  def bbcode
    text.bbcode_to_html
  end

end
