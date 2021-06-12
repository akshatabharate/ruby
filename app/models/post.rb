class Post < ApplicationRecord
    # searchkick word_middle: [:title, :body]
    # def search_data
    #     {
    #         title: title,
    #         body: body,
    #         comment: comment
    #     }
    #end
    belongs_to :user
    belongs_to :category
   
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}

    def full_name
        [title,body].join(' ')
    end
end



