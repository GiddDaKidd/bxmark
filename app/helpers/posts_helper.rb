module PostsHelper
  def allow_post_delete?(posts_path)
  return false unless current_user
  @post.user_id == current_user.id
end
end
