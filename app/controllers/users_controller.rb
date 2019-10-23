class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update destroy)
  before_action :correct_user, only: %i(edit update destroy)

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.paginate(page: params[:page]).order(created_at: :desc)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = '登録ありがとうございます'
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "退会処理をしました"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url)unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
