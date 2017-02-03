require 'food'

describe Food do

  it 'initialises food' do
    args = {name: 'Food'}
    expect(Food.new(args)).to be_an_instance_of(Food)
  end

  let!(:pairing) { spy("pairing") }

  it "should throw an error if you do not give it a sweet value on initialization" do
    expect{ Food.create({}) }.not_to change{Food.count}
  end

  it "should throw an error if you do not give it a name on initialization" do
    expect{ Food.create({sweet: 3}) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of less than zero" do
    expect{ Food.create({name:"Sweeeeeeet", sweet: -1}) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of greater than five" do
    expect{ Food.create({name:"Sweeeeeeet", sweet:6}) }.not_to change{Food.count}
  end

  describe 'checking the type of flavour' do

    it 'checks the level of food sweetness' do
      food = Food.new({name: 'Food', umami: 1, sweet: 5, spicy:1, bitter:1, sour:1})
      expect(food.is_sweet?).to eq true
    end
    it 'checks the level of food umami' do
      food = Food.new({name:"Umami", umami: 5, sweet: 0, spicy:0, bitter:0, sour:0})
      expect(food.is_umami?).to eq true
    end
    it 'checks the level of food spicyness' do
      food = Food.new({name:"Spicy", umami: 0, sweet: 0, spicy:5, bitter:0, sour:0})
      expect(food.is_spicy?).to eq true
    end
    it 'checks the level of food bitterness' do
      food = Food.new({name:"Bitter", umami: 0, sweet: 0, spicy:0, bitter:5, sour:0})
      expect(food.is_bitter?).to eq true
    end
    it 'checks the level of food sourness' do
      food = Food.new({name:"Sour", umami: 0, sweet: 0, spicy:0, bitter:0, sour:5})
      expect(food.is_sour?).to eq true
    end

  end

  it {should belong_to :pairing }

end
