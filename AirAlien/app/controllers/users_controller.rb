class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user= User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path, notice: "Unauthorize Access" #test user only access to their own profile if not redirect to root_path
    else
      return @user
    end  
  end
end