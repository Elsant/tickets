require 'rails_helper'
# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    user = create :user 
    signin(user.email, user.password)
    expect(page).to have_content user.email
    click_link 'Sign Out'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # Scenario: Agent signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'agent signs out successfully' do
    user = create :user, :agent
    signin(user.email, user.password)
    expect(page).to have_content user.email
    click_link 'Sign Out'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # Scenario: Admin signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'admin signs out successfully' do
    user = create :user, :admin
    signin(user.email, user.password)
    expect(page).to have_content user.email
    click_link 'Sign Out'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

end

