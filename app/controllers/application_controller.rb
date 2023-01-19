class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  around_action :switch_locale

  def after_sign_in_path_for(resource)
    "/projects"
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private

  def switch_locale(&action)
    # TODO: check existing locales
    # if I18n.available_locales.include?(":" + params[:locale])
      locale = params[:locale] || I18n.default_locale
      I18n.with_locale(locale, &action)
    # end
  end

  def default_url_options
    { locale: I18n.locale }
  end
  
end
