GraphblogSchema = GraphQL::Schema.define do
  max_depth 4 # adjust as required
  use GraphQL::Batch
  enable_preloading
  
  mutation(Types::MutationType)
  query(Types::QueryType)
end
