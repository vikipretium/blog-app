require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'v', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'developer')
  post = Post.new(author: user, title: 'title', text: 'text')
  subject { Comment.new(author: user, post:, text: 'comment text') }
  before { subject }

  it 'author is nil' do
    test_case = subject
    test_case.author = nil
    expect(test_case).to_not be_valid
  end

  it 'post is nil' do
    test_case = subject
    test_case.post = nil
    expect(test_case).to_not be_valid
  end

  it 'text is nil or blank' do
    test_case = subject
    test_case.text = nil
    expect(test_case).to_not be_valid
    test_case.text = ''
    expect(test_case).to_not be_valid
  end
  it 'update comments counter' do
    expect(post.comments_counter).to eq(0)
    subject.save # update_comments_counter_for_post method will run after saving the comment
    expect(post.comments_counter).to eq(1)
  end
end
