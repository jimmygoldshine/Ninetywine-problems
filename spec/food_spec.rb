require 'food'

describe Food do

  let!(:pairing) { spy("pairing") }

  it "should throw an error if you do not give it a sweet value on initialization" do
    expect{ Food.new({}, pairing) }.not_to change{Food.count}
  end

  it "should throw an error if you do not give it a name on initialization" do
    expect{ Food.new({sweet: 3}, pairing) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of less than zero" do
    expect{ Food.new({name:"Sweeeeeeet", sweet: -1}, pairing) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of greater than five" do
    expect{ Food.new({name:"Sweeeeeeet", sweet:6}, pairing) }.not_to change{Food.count}
  end

  it "should create a new pairing object" do
    food = Food.new({name:"Dummy", sweet: 3}, pairing)
    expect(pairing).to have_received(:new).with(food)
  end

end
