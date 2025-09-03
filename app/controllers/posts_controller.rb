class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
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

    if @post.secret? && !session["post_#{@post.id}_unlocked"]
      return render :password
    end

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

  def verify_password
    @post = Post.find(params[:id])
    if params[:password] == @post.password
      session["post_#{@post.id}_unlocked"] = true
      redirect_to post_path(@post), notice: "비밀번호가 맞습니다."
    else
      flash.now[:alert] = "비밀번호가 틀렸습니다."
      render :password
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :password)
  end
end
