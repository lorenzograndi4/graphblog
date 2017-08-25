Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :title, !types.String
  field :body, types.String
  field :comments, -> { !types[Types::CommentType] }
  field :postedBy, -> { Types::UserType }, property: :user
end
