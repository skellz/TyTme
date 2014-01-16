require 'spec_helper'

feature 'charity successfully signs up', %q{
  As a Charitable Orginization 
  I want to setup an account
  So I can show users my wishlists and event info
} do 
  # ACCEPTANCE CRITERIA
  # * I click on Charity Sign Up from the home page
  # * I enter a vaild Orginization name
  # * I enter a valid email address
  # * I enter a vaild address
  # * I enter a vaild phone number
  # * I enter a password
  # * I get redirected to the charity home page

  scenario 'charity registers successfully' do 
    visit root_path
    click_link 'Charity Sign Up'

    expect(page).to have_content('Charity Sign Up')

    fill_in 'Orginization Name', with: 'Liberty'
    fill_in 'Email', with: 'help@liberti.org'
    fill_in 'Address', with: '123 Main St'
    fill_in 'Zip Code', with: '11221'
    select("NY", from: :states)
    select("United States", from: :countries)
    click_button 'Charity Sign Up'

    expect(page).to have_content("Welcome! You have successfully signed up")
    expect(page).to have_content('Sign Out')
  end

  scenario 'charity tries to register unsuccessfully' do 
    visit root_path
    click_link 'Charity Sign Up'

    click_button 'Charity Sign Up'
    expect(page).to have_content("can't be blank")
  end
end