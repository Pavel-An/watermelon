class DocumentBlocksController < ApplicationController
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
  end

  def destroy
  end

  private

  def block_params
    params.require(:block).permit(:block_type, :document_id)
  end
end
