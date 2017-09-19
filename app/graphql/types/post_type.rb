Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :title, !types.String
  field :body, types.String
  field :comments, -> { !types[Types::CommentType] }
  field :postedBy, -> { Types::UserType }, property: :user
  # alternatively
  # field :postedBy, Types::UserType do
  #   resolve -> (obj, args, context) { RecordLoader.for(User).load(obj.user_id) }
  # end
end
