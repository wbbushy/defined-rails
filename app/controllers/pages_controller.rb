class PagesController < ApplicationController

  def main
    @user = User.new
    @words = UsersWord.where(user_id: session[:id])
  end

end
