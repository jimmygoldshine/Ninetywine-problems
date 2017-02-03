class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @pairing = Pairing.find(params[:pairing_id])
    p @pairing
    p params
    @food = Food.new
  end

  def create
    @pairing = Pairing.find(params[:pairing_id])
    @food = Food.create(food_params)
    @food.pairing_id = @pairing.id
    @food.save
    redirect_to pairing_path(@pairing)
  end

  private

  # def pairing_params
  #   params.permit(:pairing_id)
  # end

  def food_params
    params.require(:food).permit(:name, :sweet, :pairing_id)
  end

end
