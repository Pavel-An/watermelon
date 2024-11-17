class Blocks::NewController < ApplicationController
  def h1
    respond_to do |format|
      format.turbo_stream
    end
  end

  def h2
  end

  def text
  end
end
