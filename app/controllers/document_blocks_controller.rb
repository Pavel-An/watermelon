class DocumentBlocksController < ApplicationController
  before_action :find_block_by_id, only: [ :update, :destroy]
  before_action :find_document_by_document_id, only: [ :create ]
  
  
  def index
  end

  def new
  end

  def create
    @block = DocumentBlock.new(block_params)

    if @block.save
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def update
    @block.insert_at(params[:position].to_i)
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def block_params
    params.require(:block).permit(:block_type, :document_id, :position)
  end

  def find_block_by_id
    @block = DocumentBlock.find(params[:id])
  end

  def find_document_by_document_id
    @document = Document.find(params[:block][:document_id])
  end
end
