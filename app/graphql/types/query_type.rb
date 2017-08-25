Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allPosts, !types[Types::PostType] do
    resolve -> (obj, args, ctx) { Post.all }
  end

  field :user do
    type Types::UserType
    argument :id, !types.ID
    description "Find user by id"
    resolve -> (obj, args, ctx) { User.find(args[:id]) }
  end

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve -> (obj, args, ctx) { Post.find(args["id"]) }
  end

  # field :comment do
  #   type Types::CommentType
  #   argument :id, !types.ID
  #   description "Find a Comment by Post"
  #   resolve -> (obj, args, ctx) { Comment.find(arg["id"]) }
  # end

  # field :testField, types.String do
  #   description "An example field added by the generator"
  #   resolve ->(obj, args, ctx) {
  #     "Hello World!"
  #   }

end
