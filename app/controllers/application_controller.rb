class ApplicationController < ActionController::Base
  #FIXME locale 
  # around_action :switch_locale

  include Passwordless::ControllerHelpers

  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    #TODO replace error with translation
    redirect_to root_path, flash: { error: 'You are not worthy!' }
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  #FIXME locale not working with passwordless
  # def switch_locale(&action)

  #   if current_user_locale?
  #     locale = current_user.locale
  #   elsif I18n.available_locales.map(&:to_s).include?(params[:locale])
  #     locale = params[:locale] || I18n.default_locale
  #   else
  #     locale = I18n.default_locale
  #   end
    
  #   I18n.with_locale(locale, &action)
  # end

  def current_user_locale?
    unless current_user.nil?
      I18n.available_locales.map(&:to_s).include?(current_user.locale)
    end
  end
  
end
