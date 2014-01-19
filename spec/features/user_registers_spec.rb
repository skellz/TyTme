require 'spec_helper'

feature 'new user signs up', %q{
  As a new user 
  I want to register to the site
  So I can sign in upon return
} do
  # ACCEPTANCE CRITERIA
  # * I must specify my First Name
  # * I must specify my Last Name
  # * I must specify my email address 
  
  scenario 'user registers with valid attributes' do
    visit root_path
    click_link 'User'

    expect(page).to have_content('Sign Up')

    fill_in 'First Name', with:'Joe'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'test@example.com'
    fill_in('Password', with: 'password', match: :prefer_exact)
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have successfully signed up!')
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
  end

  scenario 'user registers with invalid attributes' do
    visit root_path
    click_link 'User'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Welcome! You have successfully signed up!')
  end
end