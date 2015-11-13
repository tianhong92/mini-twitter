class PostsController < ApplicationController
  #before_action :all_posts, only: [:index, :create]
  #respond_to :html, :js
  def new

  end

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    #@post.save
    #redirect_to @post
    if @post.save
      render partial: "/post", locals: {post: @post}
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:message)
  end
end
