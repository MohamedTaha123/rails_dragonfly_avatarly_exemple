module UsersHelper
  def user_avatar(user, options = {})
    if user.avatar.file?
      image_tag user.avatar.url(:thumb), options
    else
      image_tag user.avatar_url, options
    end
  end
end
