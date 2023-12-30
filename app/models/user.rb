class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {minimum:1}
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destory
end
