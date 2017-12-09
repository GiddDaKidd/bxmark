class Post < ApplicationRecord
  
  belongs_to :user
 has_many :categories, through: :post_categories
 has_many :comments, through: :post_comments
 has_many :post_comments

 validates :title, presence: true,
                length: { minimum: 4, maximum: 20 }

  validates :description, presence: true,
                      length: { maximum: 1000 }
  validates :user_id, presence: true

end
