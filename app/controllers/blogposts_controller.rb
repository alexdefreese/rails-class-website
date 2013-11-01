class BlogpostsController < ApplicationController

  before_filter :authenticat_user!,
    only: [:new, :create, :edit, :update, :destroy]

  def new
    @blogpost = Blogpost.new
  end

  def create
    if current_user.blogposts.build params[:blogpost]
      flash[:success] = "Created New Blogpost"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(user_params)
      flash[:success] = "Edited Blogpost"
      redirect_to @blogpost
    else
      render 'edit'
    end
  end

  def view
    @blogpost = Blogpost.find(params[:id])
  end

  def index
    @blogposts = Blogpost.all
  end
end
