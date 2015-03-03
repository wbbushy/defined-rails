class PagesController < ApplicationController

  def main
    @user = User.new
<<<<<<< Updated upstream
    @words = UsersWord.where(user_id: session[:id])
=======
<<<<<<< Updated upstream
    @words = Word.all
=======
    @words = UsersWord.where(user_id: session[:id])
    @current_user ||= User.find(session[:id]) if session[:id]
>>>>>>> Stashed changes
>>>>>>> Stashed changes
  end

end
