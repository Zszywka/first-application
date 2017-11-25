class UsersController < ApplicationController

  def signin
    if request.get?
      render "signin"
    else
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to "/"
      else
        render "signin"
      end
    end
  end

end
