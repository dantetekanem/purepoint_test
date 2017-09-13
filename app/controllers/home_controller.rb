class HomeController < ApplicationController
  def index
    @query = params[:query]
    @recipes = RecipePuppy.search(@query) if @query.present?
  end
end
