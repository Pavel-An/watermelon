class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :turbo_frame_request_variant

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
  
  
  private 
  
  def find_project
    @project = Project.find(params[:id])
  end

  def find_project_by_id
    @project = Project.find(params[:project_id])
  end
end
