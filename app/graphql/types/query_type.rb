Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve ->(obj, args, ctx) { Post.find(args["id"]) }

  # field :comment do
  #   type Types::CommentType
  #   argument :id, !types.ID
  #   description "Find a Comment by ID"
  #   resolve ->(obj, args, ctx) { Comment.find(args["id"]) }

  # field :testField, types.String do
  #   description "An example field added by the generator"
  #   resolve ->(obj, args, ctx) {
  #     "Hello World!"
  #   }

  end
end
