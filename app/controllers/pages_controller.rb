class PagesController < ApplicationController
  def index
    @models = Glass::Config.models.join(', ')
  end
end
