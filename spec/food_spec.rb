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

    it 'returns 5 when given a food with a sweetness level of 5' do
      food = Food.create({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour[:sweet]).to eq 5
    end

    it 'returns 3 when given a food with an umami level of 5' do
      food = Food.create({name: 'Food', umami: 5, sweet: 3, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour[:sweet]).to eq 3
    end

    it 'returns 5 when given a food with a sweetness level of 5' do
      food = Food.create({name: 'Food', umami: 5, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour[:umami]).to eq 5
    end

    it 'returns 5 when given a food with a spicyness level of 5' do
      food = Food.create({name: 'Food', umami: 1, sweet: 5, spicy:5, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.flavour[:spicy]).to eq 5
    end

    it 'returns 5 when given a food with a bitter level of 5' do
      food = Food.create({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:5, sour:1, pairing_id:@pairing.id})
      expect(food.flavour[:bitter]).to eq 5
    end

    it 'returns 5 when given a food with a sourness level of 5' do
      food = Food.create({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:5, pairing_id:@pairing.id})
      expect(food.flavour[:sour]).to eq 5
    end

  end

end
