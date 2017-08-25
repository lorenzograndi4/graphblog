require 'test_helper'

class Resolvers::CreatePostTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreatePost.new.call(nil, args, {})
  end

  test 'creating new post' do
    post = perform(
      title: 'a title',
      body: 'this is a body',
    )

    assert post.persisted?
    assert_equal post.body, 'this is a body'
    assert_equal post.title, 'a title'
  end
end
