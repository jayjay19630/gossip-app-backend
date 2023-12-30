class Comment < ApplicationRecord
    validates :content, :post_id, :user_id, presence: true
end
