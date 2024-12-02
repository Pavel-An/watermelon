class DocumentsController < ApplicationController
  before_action :find_project_by_project_id, only: [ :index, :new, :create ]
  before_action :find_document_by_id, only: [ :edit ]
  
  def index
    @documents = @project.documents
  end

  def new
  end

  def create
    Rails.logger.debug "#{document_params}"
    @document = @project.documents.new(document_params)
    @document.user_id = current_user.id

    if @document.save
      flash[:success] = "Document created"
      redirect_to edit_document_path(@document)
    else
      flash.now[:danger] = "Document not created"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def document_params
    params.require(:document).permit(:name, :description)
  end

  def find_project_by_project_id
    @project = Project.find(params[:project_id])
  end

  def find_document_by_id
    @document = Document.find(params[:id])
  end
end
