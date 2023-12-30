class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {minimum:1}
end
