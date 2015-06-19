class UrlsController < ApplicationController
  def create
  end

  def index 
    @urls = Url.all
  end
end
