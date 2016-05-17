class Article < ActiveRecord::Base
#add this line
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true
#add this line
    validates :user_id, presence: true
end