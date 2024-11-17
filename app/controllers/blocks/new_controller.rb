class Blocks::NewController < ApplicationController
  def h1
    respond_to do |format|
      format.turbo_stream
    end
  end

  def h2
    respond_to do |format|
      format.turbo_stream
    end
  end

  def text
    respond_to do |format|
      format.turbo_stream
    end
  end
end
