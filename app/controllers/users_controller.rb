class UsersController < ApplicationController
  
  def profile
    @user = User.find(current_user.id)
  end

  def account
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "Update successfully"
      redirect_to users_account_path
    else
      flash[:notice] = 'Update not successfully'
      render :profile
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name,:introduction,:avatar)
  end
end

