class AdultsController < ApplicationController
  def index
    @urls = Url.all.page params[:page]
  end
end
