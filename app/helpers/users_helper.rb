module UsersHelper

  def user_color(user)
    "<span class='color--user'>#{user.first_name}</span>".html_safe
  end

end
