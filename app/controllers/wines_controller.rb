class WinesController < ApplicationController

  def index
    @wines = Wine.all
    render component: 'Wines', props: { wines: @wines }
  end

end
