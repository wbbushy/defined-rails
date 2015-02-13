class UsersController < ApplicationController

  def create
    @user = User.new(user_name: params["user_name"],
                     email: params["email"]
                     )
    @user.password=(params["password"])
    @user.save
    session[:id] = @user.id
    redirect_to main_path
  end


  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end

end
