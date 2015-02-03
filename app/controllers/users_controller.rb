class UsersController < ApplicationController

  def create
    @user = User.new(user_name: params["user_name"],
                     email: params["email"]
                     )
    @user.password=(params["password"])
    @user.save
    session[:id] = @user.id
  end
end
