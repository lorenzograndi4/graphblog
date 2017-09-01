class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # GET /posts
  def query
    result = GraphblogSchema.execute params[:query]
    render json: result
  end
end
