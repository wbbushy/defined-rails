class PagesController < ApplicationController

  def main
    @user = User.new
    @words = UsersWord.where(user_id: session[:id])
    @current_user ||= User.find(session[:id]) if session[:id]
    params[:remember_me] = true
  end

  def dashboard
    @user = User.new
    @words = UsersWord.where(user_id: session[:id])
    @current_user ||= User.find(session[:id]) if session[:id]
    params[:remember_me] = true
  end

end
