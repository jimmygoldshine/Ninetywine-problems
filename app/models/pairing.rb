class Pairing < ApplicationRecord

  def initialize(food, wine_klass)
    @food = food
    get_sweet_wine(wine_klass) if is_sweet_food?
    get_umami_wine(wine_klass) if is_umami_food?
    get_spicy_wine(wine_klass) if is_spicy_food?
    get_bitter_wine(wine_klass) if is_bitter_food?
  end

  def is_sweet_food?
    @food.sweet > 3.4
  end

  def is_umami_food?
    @food.umami > 3.4
  end

  def is_spicy_food?
    @food.spicy > 3.4
  end

  def is_bitter_food?
    @food.bitter > 3.4
  end

  def get_spicy_wine(wine_klass)
    @wine = wine_klass.where('2.6 < sweet < 5 and fruity > 5.1 and acid > 5.1')
  end

  def get_sweet_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1')
  end

  def get_umami_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1 and bitter < 2.5 and fruity > 5.1')
  end

  def get_bitter_wine(wine_klass)
    @wine = wine_klass.where('bitter < 2.5 and oaky < 2.5')
  end



end
