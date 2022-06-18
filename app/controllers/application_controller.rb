class ApplicationController < ActionController::Base
  def all_users
    User.all
  end
end
