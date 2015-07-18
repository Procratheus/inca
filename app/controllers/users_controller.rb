class UsersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    
  end

  def edit

  end

  def update
    if @user.update(user_params)
      @user.admin_invite
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "There was an error updated this user. Please try again!"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User was successfully deleted"
      redirect_to users_path
    else
      flash[:error] = "There was an error deleteing this user. Please try again!"
      redirect_to @user
    end
  end

  protected

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:roles)
  end

end
