class PostsController < ApplicationController
  def index
    @user = all_posts
    @posts = @user.posts.order('id asc')
  end
  def show
    @post = current_post
  end
  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end 
end