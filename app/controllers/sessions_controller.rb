class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
   # If the user exists AND the password entered is correct.
   if user && user.authenticate(params[:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
     session[:user_id] = user.id
     redirect_to todo_lists_path
     flash[:success] = "Signed In Successfully"
   else
   # If user's login doesn't work, send them back to the login form.
     flash[:danger] = "There was an error with your E-Mail/Password combination. Please try again."
     redirect_to '/login'
   end
  end

  def destroy
   session[:user_id] = nil
   flash[:info] = "Signed Out Successfully"
   redirect_to '/login'
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
      if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
        flash[:success] = "Signed In Successfully"
        redirect_to todo_lists_path
      else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        # @next = edit_user_path(user)
        flash[:info] = "#{user.fullname} is now a new user"
        redirect_to todo_lists_path
      end

        # redirect_to '/login', :notice => @notice
    end
end
