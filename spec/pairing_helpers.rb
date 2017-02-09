module PairingHelpers

  FOOD_CHARACTERISTICS = [:sweet, :umami, :spicy, :sour, :bitter]

  def start_pairing
    visit '/'
    click_button("S T A R T   P A I R I N G")
  end

  def make_pairing(args)
    FOOD_CHARACTERISTICS.each do |char|
      form_field = (char.to_s + "_slider").to_sym
      fill_in form_field, with: args.fetch(char, default_value(char))
    end
  end

  def create_pairing(args)
    make_pairing(args)
    click_button("N E X T")
  end

  private

  def default_value(characteristic)
    characteristic == :name ? "A food" : 0
  end

end
