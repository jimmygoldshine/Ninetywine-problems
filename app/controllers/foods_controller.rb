class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new()
  end

  def create
    @food = Food.create(food_params)
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :sweet)
  end

end
