class SearchController < ApplicationController
 # @send_variable = nil

  def show
    @send_variable = params[:q]
  end
  
  def index
  end
end
