Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :body, !types.String
  field :post_id, types.ID
  field :created_at, types.String
end
