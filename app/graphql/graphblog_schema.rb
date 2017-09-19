GraphblogSchema = GraphQL::Schema.define do
  max_depth 4 # adjust as required
  use GraphQL::Batch
  enable_preloading

  mutation(Types::MutationType)
  query(Types::QueryType)
end

# set timeout if it takes more than 2 seconds
GraphblogSchema.middleware <<
  GraphQL::Schema::TimeoutMiddleware.new(max_seconds: 2) do |err, query|
    Rails.logger.info("GraphQL Timeout: #{query.query_string}")
  end
