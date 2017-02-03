require 'rails_helper'

feature 'pairng with instances of food' do

  scenario 'start using the site immediately' do
    visit('/')
    expect(page).to have_button("Start pairing!")
  end

  scenario 'create a new empty pairing' do
    visit('/pairings/new')
    expect{ click_button('Start pairing!') }.to change{Pairing.count}.by 1
  end

  scenario 'a food form can be filled in' do
    visit('/pairings/new')
    click_button('Start pairing!')
    expect(page).to have_content("Enter your food and it's characteristics")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_button("Submit")
  end

end
