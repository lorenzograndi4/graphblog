class Comment < ApplicationRecord
  belongs_to :post, validate: true
  belongs_to :user
end
