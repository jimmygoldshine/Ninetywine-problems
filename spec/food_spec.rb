require 'food'

describe Food do

  it "should throw an error if you do not give it a sweet value on initialization" do
    expect{ Food.create }.not_to change{Food.count}
  end

  it "should throw an error if you do not give it a name on initialization" do
    expect{ Food.create(sweet: 3) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of less than zero" do
    expect{ Food.create(name:"Sweeeeeeet", sweet: -1) }.not_to change{Food.count}
  end

  it "should throw an error if you give it a sweet value of greater than five" do
    expect{ Food.create(name:"Sweeeeeeet", sweet:6) }.not_to change{Food.count}
  end

end
