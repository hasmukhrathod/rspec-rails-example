class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def new
    redirect_to new_user_session_path
  end
  def create
  end
  
  def show
  end
  
  private
  def set_post
    @post = Post.find_by(slug: params[:slug])
  end
end
