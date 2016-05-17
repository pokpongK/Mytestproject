class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user= User.find(params[:id])
    if @user.email != current_user.email
      redirect_to new_user_registration_url #test user only access to their own profile if not redirect to sign in page
    else
      return @user
    end  
  end
end