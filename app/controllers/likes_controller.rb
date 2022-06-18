class LikesController < ApplicationController
  def create
    user = current_user
    post = current_post
    post.likes.where("author_id = #{user.id}").length.positive? && (
      flash[:error] = 'Error: you already liked it.'
      where_to_redirect(post)
      return
    )
    like = Like.new(author: user, post:)
    unless like.save 
      flash[:error] = 'Error: Like could not be saved'
      where_to_redirect(post)
      return
    end
    where_to_redirect(post)
  end
  private
  def where_to_redirect(post)
     if params[:distination] == 'index'
       redirect_back_or_to user_posts_url
     else
       redirect_back_or_to user_post_url(id: post.id)
     end
  end 
end
