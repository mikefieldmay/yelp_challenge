require 'rails_helper'

feature 'reviewing' do
  before do
    user_two_create_restaurant
    sign_up_user_one
  end

  scenario 'allows users to leave a review using a form' do
     visit '/restaurants'
     click_link 'Review KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('so so')
  end

  scenario "doesn't allow user to leave a review if they've already reviewed a restaurant" do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(page).not_to have_link('Review KFC')
  end
end
