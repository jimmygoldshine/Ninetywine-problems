class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @pairing = Pairing.find(params[:pairing_id])
    p @pairing
    p params
    @food = @pairing.food.new
  end

  def create
    @food = Food.create(food_params)
    # redirect_to foods_path
  end

  private

  def pairing_params
    params.permit(:pairing_id)
  end

  def food_params
    params.require(:food).permit(:name, :sweet)
  end

end
