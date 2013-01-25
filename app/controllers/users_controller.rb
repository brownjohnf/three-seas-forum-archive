class UsersController < ApplicationController
  def index
    @users = User.limit(1000)
  end
end
