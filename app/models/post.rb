class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  validates :title, presence:true, length:{minimum:4, maximum:250}
  validates :comments_counter, presence:true, 
  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence:true, 
  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recents_comments
    comments.includes(:author).order('created_at desc').limit(5)
  end
end
