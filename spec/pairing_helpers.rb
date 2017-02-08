module PairingHelpers

  DEFAULT_FOOD_VALUE = 0

  def start_pairing
    visit '/'
    click_button('Start pairing!')
  end

  def create_pairing(args)
    fill_in :food_name, with: args.fetch(:name, "A food")
    fill_in :food_sweet, with: args.fetch(:sweet, DEFAULT_FOOD_VALUE)
    fill_in :food_umami, with: args.fetch(:umami, DEFAULT_FOOD_VALUE)
    fill_in :food_spicy, with: args.fetch(:spicy, DEFAULT_FOOD_VALUE)
    fill_in :food_sour, with: args.fetch(:sour, DEFAULT_FOOD_VALUE)
    fill_in :food_bitter, with: args.fetch(:bitter, DEFAULT_FOOD_VALUE)
  end

end
