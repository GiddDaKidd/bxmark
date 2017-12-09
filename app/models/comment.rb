class Comment < ApplicationRecord
    belongs_to :post_comments
    belongs_to :user
    belongs_to :post
end
