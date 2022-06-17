class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
