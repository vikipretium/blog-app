class ApplicationController < ActionController::Base
  def current_user
    User.find(params[:id])

  end
  def all_users
    User.all
  end
  def current_post
    Post.all.where("author_id = #{params[:user_id]}").where("id = #{params[:id]}")
 
   end
 
   def all_posts
    Post.all.where("author_id = #{params[:user_id]}")
   end  
end
