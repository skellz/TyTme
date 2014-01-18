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
    click_link 'Charitable Orginizations'
  
    expect(page).to have_content('New Charity Sign Up')

    fill_in 'Orginization Name', with: 'Liberty'
    fill_in 'Email', with: 'help@liberti.org'
    fill_in 'Address', with: '123 Main St'
    fill_in 'Zip Code', with: '11221'
    select("NY", from: 'State')
    select("United States", from: 'Country')
    fill_in('Password', with: 'password', match: :prefer_exact)
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Charity Sign Up'
    
    expect(page).to have_content('Sign Out')
    expect(page).to have_content("Welcome! You have successfully signed up")
  end

  scenario 'charity tries to register unsuccessfully' do 
    visit root_path
    click_link 'Charitable Orginizations'

    click_button 'Charity Sign Up'
    expect(page).to have_content("can't be blank")
  end
end