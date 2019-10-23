class StaticePagesController < ApplicationController
  def contact
  end

  def home
     @tweet = current_user.tweets.build if logged_in?
     @tweets = Tweet.paginate(page: params[:page]).order(created_at: :desc)
   end
end
