class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  
  allow_browser versions: :modern
  around_action :switch_locale
  before_action :turbo_frame_request_variant

  def switch_locale(&action)
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: root_path, alert: exception.message
  end



  private

  def current_ability
    @current_ability ||= Ability.new(current_user, current_member)
  end

  def current_member
    if @project
      @project.member(current_user) 
    elsif @member
      @member
    end
  end
end
