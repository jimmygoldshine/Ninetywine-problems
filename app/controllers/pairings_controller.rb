class PairingsController < ApplicationController

  def index
  end

  def show
    @pairing = Pairing.find(params[:id])
    get_primary_flavour_wines(@pairing)
    get_secondary_flavour_wines(@pairing)
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

  private

  def get_primary_flavour_wines(pairing)
    pairing.get_sweet_wine(Wine)  if pairing.food.is_sweet?
    pairing.get_spicy_wine(Wine)  if pairing.food.is_spicy?
    pairing.get_sour_wine(Wine)   if pairing.food.is_sour?
    pairing.get_bitter_wine(Wine) if pairing.food.is_bitter?
    pairing.get_umami_wine(Wine)  if pairing.food.is_umami?
  end

  def get_secondary_flavour_wines(pairing)
    pairing.get_umami_x_sweet_wine(Wine)  if pairing.food.is_umami_x_sweet?
    pairing.get_umami_x_sour_wine(Wine)   if pairing.food.is_umami_x_sour?
    pairing.get_umami_x_bitter_wine(Wine) if pairing.food.is_umami_x_bitter?
    pairing.get_sweet_x_sour_wine(Wine)   if pairing.food.is_sweet_x_sour?
    pairing.get_sweet_x_bitter_wine(Wine) if pairing.food.is_sweet_x_bitter?
    pairing.get_sweet_x_spicy_wine(Wine)  if pairing.food.is_sweet_x_spicy?
    pairing.get_sour_x_bitter_wine(Wine)  if pairing.food.is_sour_x_bitter?
    pairing.get_sour_x_spicy_wine(Wine)   if pairing.food.is_sour_x_spicy?
  end

end
