class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

  def update
  end

  def destroy
  end
