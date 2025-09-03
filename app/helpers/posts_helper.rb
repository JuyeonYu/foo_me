module PostsHelper
  def post_content(post)
    post.secret? ? "비밀글입니다." : post.content
  end

  def show_copy_button?(post)
    !post.secret?
  end
end
