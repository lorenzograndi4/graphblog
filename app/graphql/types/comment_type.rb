# you can preload comments to avoid n+1 queries, i.e.:
# field :comments, !types[Types::CommentType] do
#   preload :comments
#   resolve -> (obs, args, ctx) { obj.comments }
# end
# see https://github.com/ConsultingMD/graphql-preload

Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id, !types.ID
  field :body, !types.String
  field :post, -> { Types::PostType }
  field :postedBy, -> { Types::UserType }, property: :user
end
