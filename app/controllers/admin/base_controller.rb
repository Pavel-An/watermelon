class Admin::BaseController < ActionController::Base
  around_action :use_default_locale
  

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  private
  
  def use_default_locale(&action)
    # Executes the request with the I18n.default_locale.
    # https://github.com/ruby-i18n/i18n/commit/9b14943d5e814723296cd501283d9343985fca4e
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end