require 'food'

describe Food do

  let!(:food) {described_class.create}

  it {should belong_to :pairing }

  it "should throw an error if you do not give it a name on initialization" do
    expect(food).to have(1).error_on(:name)
  end

  it "should throw an error if you do not give it a sweet value between 0 and 5 inclusive" do
    expect(food).to have(3).error_on(:sweet)
  end

  it "should throw an error if you do not give it an umami value between 0 and 5 inclusive" do
    expect(food).to have(3).error_on(:umami)
  end

  it "should throw an error if you do not give it a spicy value between 0 and 5 inclusive" do
    expect(food).to have(3).error_on(:spicy)
  end

  it "should throw an error if you do not give it a sour value between 0 and 5 inclusive" do
    expect(food).to have(3).error_on(:sour)
  end

  it "should throw an error if you do not give it a bitter value between 0 and 5 inclusive" do
    expect(food).to have(3).error_on(:bitter)
  end

  describe '#flavour' do

    before do
      @pairing = Pairing.create
    end

    it 'returns :sweet for a food with sweetness > 3.5' do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sweet
    end

    it 'does not return :sweet for food with sweetness < 3.5' do
      food = Food.new({name: 'Food', umami: 1, sweet: 3.4, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour).not_to eq :sweet
    end

    it 'returns :umami for food with umami > 3.5' do
      food = Food.new({name:"Umami", umami: 5, sweet: 0, spicy:0, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :umami
    end

    it 'returns :spicy for food with spicy > 3.5' do
      food = Food.new({name:"Spicy", umami: 0, sweet: 0, spicy:5, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :spicy
    end

    it 'returns :bitter for food with bitter > 3.5' do
      food = Food.new({name:"Bitter", umami: 0, sweet: 0, spicy:0, bitter:5, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :bitter
    end

    it 'returns :sour for food with sour > 3.5' do
      food = Food.new({name:"Sour", umami: 0, sweet: 0, spicy:0, bitter:0, sour:5, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sour
    end

    it 'returns :umami_x_sweet for food with strong umami and sweet flavours' do
      food = Food.new({name:"Umami & Sweet", umami: 5, sweet: 5, spicy:0, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :umami_x_sweet
    end

    it 'returns :umami_x_sour for food with strong umami and sour flavours' do
      food = Food.new({name:"Umami & Sour", umami: 5, sweet: 0, spicy:0, bitter:0, sour:5, pairing_id:@pairing.id})
      expect(food.flavour).to eq :umami_x_sour
    end

    it 'returns :umami_x_bitter for food with strong umami and bitter flavours' do
      food = Food.new({name:"Umami & Bitter", umami: 5, sweet: 0, spicy:0, bitter:5, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :umami_x_bitter
    end

    it 'returns :sweet_x_sour for food with strong sweet and sour flavours' do
      food = Food.new({name:"Sweet & Sour", umami: 0, sweet: 5, spicy:0, bitter:0, sour:5, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sweet_x_sour
    end

    it 'returns :sweet_x_bitter for food with strong sweet and bitter flavours' do
      food = Food.new({name:"Sweet & Sour", umami: 0, sweet: 5, spicy:0, bitter:5, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sweet_x_bitter
    end

    it 'returns :sweet_x_spicy for food with strong sweet and spicy flavours' do
      food = Food.new({name:"Sweet & Sour", umami: 0, sweet: 5, spicy:5, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sweet_x_spicy
    end

    it 'returns :sour_x_bitter for food with strong sour and bitter flavours' do
      food = Food.new({name:"Sweet & Sour", umami: 0, sweet: 0, spicy:0, bitter:5, sour:5, pairing_id:@pairing.id})
      expect(food.flavour).to eq :sour_x_bitter
    end

  end

  describe '#is_single_flavour?' do

    before do
      @pairing = Pairing.create
    end

    it "returns true if a food has a single strong flavour" do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_single_flavour?).to be_truthy
    end

    it "returns false if a food has > 1 strong flavour" do
      food = Food.new({name: 'Food', umami: 5, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_single_flavour?).to be_falsey
    end

  end

  describe '#is_combined_flavour?' do

    before do
      @pairing = Pairing.create
    end

    it 'returns true if a food has >1 strong flavours' do
      food = Food.new({name: 'Food', umami: 5, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_combined_flavour?).to be_truthy
    end

    it 'returns false if a food has <2 strong flavours' do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_combined_flavour?).to be_falsey
    end

  end

end
