class Pairing < ApplicationRecord

  def initialize(food, wine_klass)
    @food = food
    get_sweet_wine(wine_klass) if is_sweet_food?
  end

  def is_sweet_food?
    @food.sweet > 3.0
  end

  def get_sweet_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1')
  end

end
