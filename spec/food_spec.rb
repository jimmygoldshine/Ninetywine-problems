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

  end


  describe 'checking the type of flavour' do

    before do
      @pairing = Pairing.create
    end

    it 'checks the level of food sweetness' do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_sweet?).to eq true
    end
    xit 'checks the level of food umami' do
      food = Food.new({name:"Umami", umami: 5, sweet: 0, spicy:0, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.is_umami?).to eq true
    end
    xit 'checks the level of food spicyness' do
      food = Food.new({name:"Spicy", umami: 0, sweet: 0, spicy:5, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.is_spicy?).to eq true
    end
    xit 'checks the level of food bitterness' do
      food = Food.new({name:"Bitter", umami: 0, sweet: 0, spicy:0, bitter:5, sour:0, pairing_id:@pairing.id})
      expect(food.is_bitter?).to eq true
    end
    xit 'checks the level of food sourness' do
      food = Food.new({name:"Sour", umami: 0, sweet: 0, spicy:0, bitter:0, sour:5, pairing_id:@pairing.id})
      expect(food.is_sour?).to eq true
    end

  end

end
