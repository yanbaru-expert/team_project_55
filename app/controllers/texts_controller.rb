class TextsController < ApplicationController
  def index
    @texts = Text.order(:id)
  end

  def show; end
end
