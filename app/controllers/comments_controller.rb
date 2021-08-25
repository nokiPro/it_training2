class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def create
    blog = Blog.find(params[:blog_id])
    @comment = blog.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to users_show_path(id: user.id), notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
