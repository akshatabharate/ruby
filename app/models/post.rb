class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: {minimum: 5},
    format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
end
