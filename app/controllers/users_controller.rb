class UsersController < ApplicationController
  
  before_action :require_user!
  before_action :get_user, only: %i[ show edit update destroy ]

  include Passwordless::ControllerHelpers

  def create
    @user = User.new user_params
    
    if @user.save
      sign_in @user
      redirect_to @user, flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end
  
  def new
    @user = User.new
  end

  def show
    #REMOVE clean up if works
    # if @user.id != current_user.id
    #   redirect_to(root_path)
    # end
  end

  def edit
  end

  def update
    #REMOVE clean up here and views
    # @user.email = user_params[:email]
    @user.timezone = user_params[:timezone]
    @user.locale = user_params[:locale] 

    respond_to do |format|
      if @user.save
        format.turbo_stream
      else
        flash.now[:error] = t('flash.alert.settings.error')
        format.turbo_stream { render turbo_stream: turbo_stream.update("flash", partial: "layouts/flash") }
      end
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :timezone, :locale)
  end

end
