class Pairing < ApplicationRecord

  def initialize(food, wine_klass)
    @food = food
    get_sweet_wine(wine_klass) if is_sweet_food?
    get_umami_wine(wine_klass) if is_umami_food?
  end

  def is_sweet_food?
    @food.sweet > 3.4
  end

  def is_umami_food?
    @food.umami > 3.4
  end

  def get_sweet_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1')
  end

  def get_umami_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1 and bitter < 2.5 and fruity > 5.1')
  end

end
