class PairingsController < ApplicationController

  def index
  end

  def new
    @pairing = Pairing.new
  end

  def create
    @food = Food.new
    @pairing = Pairing.create
    redirect_to new_pairing_food_path(@pairing)
  end

  def pairing_params
    params.require(:pairing).permit(:id)
  end

end
