class UsersController < ApplicationController

  def new  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/login'
      flash[:success] = "Signed Up Successfully, proceed to Sign In"
    else
      redirect_to '/signup'
      flash[:danger] = @user.errors.full_messages.to_sentence
      # "There was an error when you tried to Sign Up. Please try again with new email and password."
    end
  end

  # def destroy
  # end


  private
  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end

end
