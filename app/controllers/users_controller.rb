class UsersController < ApplicationController

  def create
    @user = User.new(user_name: params["user_name"],
                     email: params["email"]
                     )
    @user.password=(params["password"])
    if @user.save
      session[:id] = @user.id
      redirect_to dashboard_path
    else
      flash[:useralert] = "Username already exists!"
      redirect_to main_path
    end
  end


  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end

end
