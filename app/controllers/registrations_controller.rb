class RegistrationsController < Devise::RegistrationsController 

  def new 
    flash[:info] = "There is no user sign up available for this app, you must be invited by existing user."
    redirect_to new_user_session_path
  end

  def create
    flash[:info] = "There is no user sign up available for this app, you must be invited by existing user."
    redirect_to new_user_session_path
  end 

  def edit
    super
  end

  def update
    super
  end

end
