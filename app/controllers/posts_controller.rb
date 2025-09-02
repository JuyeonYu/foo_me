class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "등록 완료!"
    else
      @posts = Post.all
      flash.now[:alert] = "저장에 실패했어요"
      render :index, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
