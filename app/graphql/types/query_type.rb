Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allPosts, !types[Types::PostType] do
    argument :limit, types.Int, default_value: 10, prepare: -> (limit) {[limit, 30].min}
    resolve -> (obj, args, ctx) { 
      Post.limit(args[:limit]).order(id: :desc)
    }
  end

  field :user do
    type Types::UserType
    argument :email, !types.String
    description "Find user by email"
    resolve -> (obj, args, ctx) { User.find_by(email: args[:email]) }
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
