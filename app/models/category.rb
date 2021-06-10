class Category < ApplicationRecord
    has_many :posts
    validates :category, uniqueness: true
end
