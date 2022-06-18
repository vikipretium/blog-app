class UsersController < ApplicationController
  def index
  @users = all_users  
  end

  def show; end
end
