class BlogpostsController < ApplicationController

  before_filter :authenticate_user!,
    only: [:new, :create, :edit, :update, :destroy]

  def new
    @blogpost = Blogpost.new
  end

  def create
    if current_user.blogposts.create blogpost_params
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
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Edited Blogpost"
      redirect_to @blogpost
    else
      render 'edit'
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
    @comments = Comment.all
    @new_comment = Comment.new
  end

  def index
    @blogposts = Blogpost.all
  end

  private
    def blogpost_params
      params.require(:blogpost).permit(:title, :body)
    end
end
