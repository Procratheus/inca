class UsersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_user, except: [:index]

  def index
    @users = User.with_deleted
    authorize @users
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      @user.admin_invite
      @user.record_history(current_user)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "There was an error updated this user. Please try again!"
      render :edit
    end
  end

  def re_activate
    @user.update(deleted_at: nil)
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  protected

  def set_user
    @user = User.with_deleted.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:role)
  end

end
