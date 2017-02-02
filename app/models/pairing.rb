class Pairing < ApplicationRecord

  has_one :food

  # def initialize(food)
  #   @food = food
  # end

  def is_sweet_food?
    @food.sweet > 3.0
  end

  def get_sweet_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1')
  end

end
