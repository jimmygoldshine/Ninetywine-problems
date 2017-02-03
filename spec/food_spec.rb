require 'food'

describe Food do

  before do
    @pairing = Pairing.create
  end

  it "should throw an error if you do not give it a sweet value on initialization" do
    expect{ Food.create({pairing_id:@pairing.id}) }.not_to change{Food.count}
  end

  it "should throw an error if you do not give it a name on initialization" do
    expect{ Food.create({sweet: 3, pairing_id:@pairing.id}) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of less than zero" do
    expect{ Food.create({name:"Sweeeeeeet", sweet: -1, pairing_id:@pairing.id}) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of greater than five" do
    food = Food.create(name:"Sweeeeeeet", sweet:6, pairing_id:@pairing.id)
    expect{ food.save }.not_to change{Food.count}
  end

  it {should belong_to :pairing }

  it "should throw an error if you do not give it an umami value on initialization" do
    food = Food.new(name:"Umami", sweet:1, pairing_id:@pairing.id)
    expect{ food.save }.not_to change{Food.count}

  end

end
