class Category < ApplicationRecord
    # belongs_to :user
    has_many :posts
    validates :category, presence: true, uniqueness: { case_sensitive: false }
end
