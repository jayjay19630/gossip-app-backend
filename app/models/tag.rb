class Tag < ApplicationRecord
    validates :tag_name, presence: true
    has_many :post_tags
    has_many :posts, through: :post_tags
end
