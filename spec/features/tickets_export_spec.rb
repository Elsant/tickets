require 'rails_helper'

  # Feature: Sign in
  #   As a user, agent, admin
  #   I want to sign in
  #   So I can visit protected areas of the site
  #   So I can get closed tickets report in pdf
feature "Get closed tickets report in pdf", :feature do

  # Scenario: Agent can sign in with valid credentials
  #   Given I exist as a user with role agent
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I click on download link
  #   Then I get closed tickets report in pdf
  scenario "agent receives closed tickets report in pdf" do
    user = create :user, :agent
    signin(user.email, user.password)
    visit root_path
    click_on 'Export Report'
    expect(page.status_code).to eq 200 
    expect(page.response_headers["Content-Type"]).to eq "application/pdf"
    expect( page.response_headers["Content-Disposition"]).to eq "attachment; filename=\"report.pdf\""
  end

  # Scenario: Admin can sign in with valid credentials
  #   Given I exist as a user with role admin
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I click on download link
  #   Then I get closed tickets report in pdf
  scenario "admin receives closed tickets report in pdf" do
    user = create :user, :admin
    signin(user.email, user.password)
    visit root_path
    click_on 'Export Report'
    expect(page.status_code).to eq 200 
    expect(page.response_headers["Content-Type"]).to eq "application/pdf"
    expect( page.response_headers["Content-Disposition"]).to eq "attachment; filename=\"report.pdf\""
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user with role user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I can not click on download link
  scenario "user doesn't see link to export report" do
    user = create :user
    signin(user.email, user.password)
    visit root_path
    expect(page).to_not have_content 'Export Report'
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user with role user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I get closed tickets report in pdf
  scenario "user doesn't receives closed tickets report" do
    user = create :user
    signin(user.email, user.password)
    visit export_tickets_path(format: :pdf)
    expect(page).to have_content user.email
    expect(page.response_headers["Content-Type"]).to_not eq "application/pdf"
    expect( page.response_headers["Content-Disposition"]).to_not eq "attachment; filename=\"report.pdf\""
  end  
end