class User < ApplicationRecord
    validates :username, presence: true
    validates :username, unique: true
    validates :username, length: {minimum:1}
end
