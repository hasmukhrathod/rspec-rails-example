class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def show
  end
  
  private
  def set_post
    @post = Post.find_by(slug: params[:slug])
  end
  def post_params
    params.require(:post).permit(:title, :body, :email, :user_id)
  end
end
