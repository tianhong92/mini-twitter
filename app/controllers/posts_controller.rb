class PostsController < ApplicationController
  before_action :logged_in_required
  def index
    #@posts = current_user.posts.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], per_page: 5)
    #another way of doing this
    #@posts = Post.where(user_id:current_user.id).order(created_at: :desc)
    @post = Post.new
    #@post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render partial: "post", locals: {post: @post}
    else
      render json: @post.errors, status: 422
    end
  end

  def show
    @post = Post.find(params[:id])
    # code to deny the access permission
    # if @post.user != current_user
    #   flash[:alert] = 'No permission for you'
    #   redirect_to root_path
    # end
    # OR
    # @post.current_user.orders.find(params[:id])
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
