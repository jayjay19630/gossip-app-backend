class Post < ApplicationRecord
    validates :title, presence: true 
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :comments, dependent: :destroy
    has_many :users, through: :likes
end
