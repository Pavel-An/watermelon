class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  private 
  
  def find_project
    @project = 
      if params.include?(:id) 
        Project.find(params[:id])
      elsif params.include?(:project_id) 
        Project.find(params[:project_id])
      end
  end
end
