module ApplicationHelper

  def resource_name
   :user
  end

  def resource
   @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end

  def date_output(time)
    Date.parse(time.to_s)
  end

end
