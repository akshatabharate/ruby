class Post < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: {minimum: 5}

def full_name
    [title,body].join(' ')
end



end
