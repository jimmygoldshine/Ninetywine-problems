require 'rails_helper'

feature 'food features' do

  scenario 'have the opportunity to add your food and the characteristics of said food' do
    visit('/pairings/new')
    click_button('Start pairing!')
    expect(page).to have_content("Enter your food and it's characteristics")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_css("input#food_umami")
    expect(page).to have_css("input#food_spicy")
    expect(page).to have_css("input#food_sour")
    expect(page).to have_css("input#food_bitter")
    expect(page).to have_button("Submit")
  end

end
