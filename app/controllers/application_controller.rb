class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  around_action :switch_locale
  def introducing some errors here
    and some more errors
      end
  def after_sign_in_path_for(resource)
    "/projects"
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private

  def switch_locale(&action)

    if current_user_locale?
      locale = current_user.locale
    elsif I18n.available_locales.map(&:to_s).include?(params[:locale])
      locale = params[:locale] || I18n.default_locale
    else
      locale = I18n.default_locale
    end
    
    I18n.with_locale(locale, &action)
  end

  def current_user_locale?
    unless current_user.nil?
      I18n.available_locales.map(&:to_s).include?(current_user.locale)
    end
  end

  # def default_url_options
  #   { locale: I18n.locale }
  # end
  
end
