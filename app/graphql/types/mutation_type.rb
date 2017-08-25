Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createPost, function: Resolvers::CreatePost.new
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :createComment, function: Resolvers::CreateComment.new
end
