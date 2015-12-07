class UsersController < ApplicationController
  require 'digest/md5'
  include ApplicationHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :logged_in_required, :except => [:new, :create]
  respond_to :json, :html

  def index
    @users = User.all
  end


  def show
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully sign up!"
      redirect_to posts_path
    else
        render :new
    end
  end


  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

end
