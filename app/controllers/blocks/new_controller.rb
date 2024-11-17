class Blocks::NewController < ApplicationController
  def h1
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(Quote.new, partial: "blocks/new/_h1")
      end
    end
  end

  def h2
  end

  def text
  end
end
