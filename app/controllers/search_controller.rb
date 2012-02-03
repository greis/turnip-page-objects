class SearchController < ApplicationController

  def create
    @documents = Document.search(params[:q])
    render :index
  end

end
