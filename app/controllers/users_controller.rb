class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user].permit(:first_name,
                                            :last_name,
                                            :email,
                                            :password,
                                            :password_confirmation))
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome to Restaunt, #{user.first_name}"
    else
      flash.now.alert = "Try again!"
      render 'new'
    end
  end
end
