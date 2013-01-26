Tire.configure do
  url ENV['SEARCHBOX_URL'] if Rails.env.production?
  ELASTICSEARCH_INDEX = 'three-seas-forum'
end
