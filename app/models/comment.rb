class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :update_comments_counter

  validates :text, presence: true, length: { minimum: 1 }
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
