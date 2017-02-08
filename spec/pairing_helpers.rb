module PairingHelpers

  FOOD_CHARACTERISTICS = [:name, :sweet, :umami, :spicy, :sour, :bitter]

  def start_pairing
    visit '/'
    click_button('Start pairing!')
  end

  def make_pairing(args)
    FOOD_CHARACTERISTICS.each do |char|
      form_field = ("food_" << char.to_s).to_sym
      fill_in form_field, with: args.fetch(char, default_value(char))
    end
  end

  def create_pairing(args)
    make_pairing(args)
    click_button("Submit")
  end

  private

  def default_value(characteristic)
    characteristic == :name ? "A food" : 0
  end

end
