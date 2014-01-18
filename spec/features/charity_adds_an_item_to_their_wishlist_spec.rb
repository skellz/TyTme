require 'spec_helper'

feature 'charity adds an item to their wishlist', %q{
  As an authorized Charitable Orginization
  I want to add items to my wishlist
  so users can purchase them for me
} do 
  # ACCEPTANCE CRITERIA
  # * Charity visits their home page
  # * Clicks on link wishlist
  # * Clicks on link add items
  # * Views available items
  # * Click on item
  # * Click on add item 
  # * Redirected to all items page

  charity = FactoryGirl.create(:charity)
  visit root_path
  click_link 'Charity'
  fill_in 'email', with: charity.email
  fill_in 'password', with: charity.password
  click_button 'Sign In'

  click_link 'Wishlist'
  click_link 'Add Items'
  click_link 'Soup'
  click_link 'Add Item'

  expect(page).to have_content('Soup')
  expect(page).to have_content('Item successfully added')

end