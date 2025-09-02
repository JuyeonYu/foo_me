class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "등록 완료!"
    else
      @posts = Post.all
      flash.now[:alert] = "저장에 실패했어요"
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])

    qrcode = RQRCode::QRCode.new(@post.content)
    @qr_png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      fill: "white",
      module_px_size: 6, # 6px * 모듈 = 전체 크기
      size: 220
    )
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
