require 'rails_helper'

feature 'food features' do

  scenario 'have the opportunity to add your food and sweetness' do
    visit('/foods/new')
    expect(page).to have_content("Enter your food and it's characteristics")
    expect(page).to have_css("input#food_name")
    expect(page).to have_css("input#food_sweet")
    expect(page).to have_button("Submit")
  end

end
