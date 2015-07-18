class ConfirmationsController < Devise::ConfirmationsController


  def new
    flash[:info] = "You cannot resend confirmations. Please delete the unconfirmed user and resend the invitation."
    redirect_to new_user_session_path
  end

  def create
    flash[:info] = "You cannot resend confirmations. Please delete the unconfirmed user and resend the invitation."
    redirect_to new_user_session_path
  end

  def show
    flash[:info] = "You cannot resend confirmations. Please delete the unconfirmed user and resend the invitation."
    redirect_to new_user_session_path
  end

end
