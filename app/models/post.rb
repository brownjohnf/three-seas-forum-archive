class Post < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks
  index_name ELASTICSEARCH_INDEX
  mapping do
    indexes :subject, :as => 'subject', :index => :not_analyzed
    indexes :content, :as => proc { |post| ActionController::Base.helpers.strip_tags(post.bbcode) }
    indexes :user_id
  end

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

  def subject
    subject ||= topic.title
  end

end
