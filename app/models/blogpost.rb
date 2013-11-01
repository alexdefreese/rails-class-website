class Blogpost < ActiveRecord::Base
    attr_accessor :title, :body, :created_at

    belongs_to :user
end
