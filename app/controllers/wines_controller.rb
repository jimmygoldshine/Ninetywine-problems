class WinesController < ApplicationController

  def index
    puts params
    if params[:q]
      @wine = Wine.find_by(name: params[:q])
      redirect_to wine_path(@wine.id)
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  private

  def wine_params
    params.require(:wine).permit(:q, :id, :name)
  end

end
