class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  # before_action :set_locale
  before_action ->{ @remote_ip = request.headers['REMOTE_ADDR'] }

  
  protected 
    def set_locale
      # I18n.locale = request.headers['Accept-Language']
      locales = I18n.available_locales
      I18n.locale = http_accept_language.compatible_language_from(localses)
    end
end
