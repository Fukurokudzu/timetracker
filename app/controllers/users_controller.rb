class UsersController < ApplicationController

  before_action :get_user, only: %i[ show edit update destroy ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render('new')
    else
      render('login')
    end

  end

  def show
    if @user.id != current_user.id
      redirect_to(root_path)
    end
  end

  def edit
  end

  def update
    @user.email = (user_params[:email])
    respond_to do |format|
      if @user.save
        format.turbo_stream
      end
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).
      permit(:email, :password, :password_confirmation)
  end

end
