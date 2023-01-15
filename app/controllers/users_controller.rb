class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      # redirect_to(controller: :tasks)
      render('new')
    else
      render('login')
    end

  end

  def show
    # render('show')
  end

  private

  def user_params
    params.require(:user).
      permit(:email, :password, :password_confirmation)
  end

end
