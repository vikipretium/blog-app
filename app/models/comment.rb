class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
