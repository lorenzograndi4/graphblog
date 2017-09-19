class Resolvers::CreatePost < GraphQL::Function
  # arguments passed as "args"
  argument :title, !types.String
  argument :body, types.String

  # return type from the mutation
  type Types::PostType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Post.create!(
      title: args[:title],
      body: args[:body],
      user: _ctx[:current_user]
    )

  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("No post with ID #{args[:postId]} found.")
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end
end
