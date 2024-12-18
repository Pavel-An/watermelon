class DocumentsController < ApplicationController
  before_action :find_project_by_project_id, only: [ :index, :new, :create ]
  before_action :find_document_by_id, only: [ :edit, :update, :show ]

  def index
    if @project
      @documents = @project.documents
    else
      @documents = Document.all
    end
  end

  def new
  end

  def create
    @document = @project.documents.new(document_params)
    @document.user_id = current_user.id

    if @document.save
      flash[:success] = "Document created"
      redirect_to edit_document_path(@document)
    else
      flash.now[:danger] = "Document not created"
    end
  end

  def show
  end

  def edit
    @document_blocks = @document.document_blocks
  end

  def update
    @document.update(document_params)
    if @document.save
      redirect_to @document
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :status, document_blocks_attributes: [ :id, :content, :reach_content ])
  end

  def find_project_by_project_id
    project_id = params[:project_id]

    if project_id
      @project = Project.find(project_id)
    end
  end

  def find_document_by_id
    @document = Document.find(params[:id])
  end
end
