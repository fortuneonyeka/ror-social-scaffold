class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    relevant_posts = current_user.posts.select { |post| post.created_at }
    current_user.friends.includes(:posts).each do |friend|
      relevant_posts += friend.posts
    end
    @timeline_posts = relevant_posts.sort { |p1, p2|  p2.created_at <=> p1.created_at }
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
