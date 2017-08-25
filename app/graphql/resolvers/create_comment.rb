class Resolvers::CreateComment < GraphQL::Function
  argument :postId, types.ID
  argument :body, types.String

  type Types::CommentType

  def call(_obj, args, _ctx)
    Comment.create!(
      post: Post.find_by(id: args[:postId]),
      body: args[:body],
      user: _ctx[:current_user]
    )
  end
end
