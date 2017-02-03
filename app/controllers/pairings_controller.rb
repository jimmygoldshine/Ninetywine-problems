class PairingsController < ApplicationController

  def index
  end

  def show
    @pairing = Pairing.find(params[:id])
  end

  def new
    @pairing = Pairing.new
  end

  def create
    @pairing = Pairing.create
    redirect_to "/pairings/#{@pairing.id}/foods/new"
  end

  def pairing_params
    params.require(:pairing).permit(:id)
  end

end
