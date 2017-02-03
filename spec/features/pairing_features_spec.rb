require 'rails_helper'

feature 'pairng with instances of food' do

  scenario 'create a new empty pairing' do
    visit('/pairings/new')
    expect{ click_button('Submit') }.to change{Pairing.count}.by 1
  end

  scenario 'a food form can be filled in' do
    visit('/pairings/new')
    click_button('Submit')
    expect(page).to have_content("Enter your food and it's characteristics")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_button("Submit")
  end

end
