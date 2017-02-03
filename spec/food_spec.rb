require 'food'

describe Food do

  before do
    @pairing = Pairing.create
  end

  it {should belong_to :pairing }

  it "should throw an error if you do not give it a name on initialization" do
    expect{ Food.create({sweet: 3, pairing_id:@pairing.id}) }.not_to change{Food.count}
  end

  describe '#sweet' do
    it "should throw an error if you do not give it a sweet value on initialization" do
      expect{ Food.create({pairing_id:@pairing.id}) }.not_to change{Food.count}
    end

    it "should throw an error if you give it a sweet value of less than zero" do
      expect{ Food.create({name:"Sweeeeeeet", sweet: -1, pairing_id:@pairing.id}) }.not_to change{Food.count}
    end

    it "should throw an error if you give it a sweet value of greater than five" do
      food = Food.create(name:"Sweeeeeeet", sweet:6, pairing_id:@pairing.id)
      expect{ food.save }.not_to change{Food.count}
    end

  end

  describe '#umami' do
    it "should throw an error if you do not give it an umami value on initialization" do
      food = Food.new(name:"Umami", sweet:1, pairing_id:@pairing.id)
      expect{ food.save }.not_to change{Food.count}
    end

    it "should throw an error if you give it an umami value of less than zero" do
      expect{ Food.create({name:"Umami", sweet:2, umami:-1, pairing_id:@pairing.id}) }.not_to change{Food.count}
    end

    it "should throw an error if you give it an umami value of greater than five" do
      food = Food.new(name:"Umami", sweet:2, umami:7, pairing_id:@pairing.id)
      expect{ food.save }.not_to change{Food.count}
    end

  end

  describe 'checking the type of flavour' do

    it 'checks the level of food sweetness' do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1, pairing_id:@pairing.id})
      expect(food.is_sweet?).to eq true
    end
    it 'checks the level of food umami' do
      food = Food.new({name:"Umami", umami: 5, sweet: 0, spicy:0, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.is_umami?).to eq true
    end
    it 'checks the level of food spicyness' do
      food = Food.new({name:"Spicy", umami: 0, sweet: 0, spicy:5, bitter:0, sour:0, pairing_id:@pairing.id})
      expect(food.is_spicy?).to eq true
    end
    it 'checks the level of food bitterness' do
      food = Food.new({name:"Bitter", umami: 0, sweet: 0, spicy:0, bitter:5, sour:0, pairing_id:@pairing.id})
      expect(food.is_bitter?).to eq true
    end
    it 'checks the level of food sourness' do
      food = Food.new({name:"Sour", umami: 0, sweet: 0, spicy:0, bitter:0, sour:5, pairing_id:@pairing.id})
      expect(food.is_sour?).to eq true
    end

  end

end
