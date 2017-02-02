class Pairing < ApplicationRecord

  def initialize(food_klass)
    @food = food_klass
  end

  def sweet_food?
    @food.sweet > 3.0
  end

end
