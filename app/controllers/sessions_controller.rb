class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.name == params[:session][:name]
      login(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'nameまたはemailが正しくありません'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
