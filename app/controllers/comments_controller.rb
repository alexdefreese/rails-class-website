class CommentsController < ApplicationController
  def create
    blogpost = params[:blogpost_id]

    comment = Comment.new(comments_params)
    comment.blogpost_id = blogpost.id

    if current_user.comments.add(comment)
      flash[:success] = "Posted Comment"
      redirect_to blogpost
    else
      render blogpost
    end
  end

  def update

  end

  private
    def comments_params
      params.require(:comment).permit(:comment)
    end

end
