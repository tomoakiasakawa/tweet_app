class TweetsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @tweets = Tweet.paginate(page: params[:page]).order(created_at: :desc)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = 'つぶやきました'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:success] = "削除しました"
    redirect_to root_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
