require 'rails_helper'

feature 'food features' do

  scenario 'enter only the name of your food' do
    visit('/pairings/new')
    click_button("S T A R T   P A I R I N G")
    expect(page).to have_css("input#food_name")
  end

  scenario 'sweetness field appears' do
    visit('/pairings/new')
    click_button("S T A R T   P A I R I N G")
    fill_in "What are you eating?", with: "Sweet potato"
    click_button('N E X T')
    expect(page).to have_css("input#sweet_slider")
  end

end
