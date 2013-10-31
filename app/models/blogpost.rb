class Blogpost < ActiveRecord::Base
    attr_accessible :title, :body, :created_at

    belongs_to :user
end
