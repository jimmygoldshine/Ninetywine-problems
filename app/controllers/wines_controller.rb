class WinesController < ApplicationController

  def index
    @wines = Wine.all
    render component: 'Wines', props: { wines: @wines }
  end

  def show
    @wine = Wine.find_by(name: wine_params[:q])
    erb :'show/:id'
  end

  private

  def wine_params
    params.permit(:q)
  end

end
