class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: {minimum: 10, maximum: 20}
end
