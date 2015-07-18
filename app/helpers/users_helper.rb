module UsersHelper

  def shortdate(date)
    @date = date
    @date.to_formatted_s(:rfc822)
  end
end
