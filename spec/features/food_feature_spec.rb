require 'rails_helper'

feature 'food features' do

  scenario 'enter only the name of your food' do
    visit('/pairings/new')
    click_button('Start pairing!')
    expect(page).to have_content("What food are you pairing wine with?")
    expect(page).to have_css("input#food_name")
  end

  scenario 'sweetness field appears' do
    visit('/pairings/new')
    click_button('Start pairing!')
    fill_in "Name", with: "Sweet potato"
    click_button('Next')
    expect(page).to have_css("input#food_sweet")
  end

end
