class BlogpostsController < ApplicationController

  before_filter :authenticat_user!

  def new
    @blogpost = Blogpost.new
  end

  def create
    current_user.blogposts.create params[:blogpost]
  end

  def edit
  end

  def update

  end

  def view
    @blogpost = Blogpost.find(params[:id])
  end

  def index
    @blogposts = Blogpost.all
  end
end
