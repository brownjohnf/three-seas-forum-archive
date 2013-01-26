class SearchController < ApplicationController
  def index
    search = Tire.search ELASTICSEARCH_INDEX do |s|
      s.query { |q| q.string "content:*#{params[:q]}*" }
      s.highlight :content, :options => { :tag => '<strong class="highlight">' }
      s.size 20
      s.from params[:page] || 1
    end
    @results = search.results
  end
end
