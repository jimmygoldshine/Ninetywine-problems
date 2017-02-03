class Pairing < ApplicationRecord

  def initialize(food, wine_klass)
    @food = food
    get_sweet_wine(wine_klass) if @food.is_sweet?
    get_umami_wine(wine_klass) if @food.is_umami?
    get_spicy_wine(wine_klass) if @food.is_spicy?
    get_bitter_wine(wine_klass) if @food.is_bitter?
    get_sour_wine(wine_klass) if @food.is_sour?
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

  def get_sour_wine(wine_klass)
    @wine = wine_klass.where('sweet > 5.1 and bitter < 2.5 and oaky < 2.5')
  end


end
