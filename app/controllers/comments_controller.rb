class CommentsController < ApplicationController
    def new
       respond_to do |format|
         format.html { render :new, locals: { comment: Comment.new } }
       end
     end
     def create
       user = current_user
       post = current_post
       comment = Comment.new(params.require(:comment).permit(:text))
       comment.author = user
       comment.post = post
         if comment.save
           flash[:success] = "Comment saved successfully"
           redirect_to user_post_url(id:post.id)
         else
           flash[:error] = "Error: Comment could not be saved"
           redirect_to new_user_post_comment_url
       end 
     end 
   end