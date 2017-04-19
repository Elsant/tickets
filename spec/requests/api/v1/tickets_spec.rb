require "rails_helper"

RSpec.describe "Tickets API", :request do
  it 'sends a list of tickets for user' do
    user = create :user
    sign_in user
    FactoryGirl.create_list(:ticket, 10, user: user)

    get '/api/v1/tickets'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['tickets'].length).to eq(10)
  end

  it 'sends a list of tickets for agent' do
    user1 = create :user
    sign_in user1
    FactoryGirl.create_list(:ticket, 10, user: user1)

    user2 = create :user
    sign_in user2
    FactoryGirl.create_list(:ticket, 10, user: user2)

    agent = create :user, role: :agent
    sign_in agent

    get '/api/v1/tickets'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['tickets'].length).to eq(20)
  end

  it 'creates a ticket' do
    user = create :user
    sign_in user
    ticket = build(:ticket, user: user)  
    params =  {params: { ticket: {title: ticket.title,  body: ticket.body}}}

    post "/api/v1/tickets", params
    expect(response).to be_created
    expect(JSON.parse(response.body)['title']).to eq(ticket.title) 
    expect(JSON.parse(response.body)['created_at']).to eq(nil)
  end

   it 'builds a ticket and returns a unprocessable_entity' do
    user = create :user
    sign_in user
    ticket = build(:ticket, user: nil)  
    params =  {params: { ticket: {title: nil,  body: ticket.body}}}

    post "/api/v1/tickets", params
    expect(response).not_to be_created
    expect(response.code).to eq "422"
    expect(response).to have_http_status 422
    expect(JSON.parse(response.body)['title']).not_to eq(ticket.title) 
    expect(JSON.parse(response.body)['created_at']).to eq(nil)
  end

  it 'closes a ticket' do
    user = create :user
    sign_in user
    ticket = create(:ticket, user: user, closed: nil)  

    patch "/api/v1/tickets/#{ticket.id}/close"
    expect(response).to be_success
    expect(JSON.parse(response.body)['tickets']).not_to be_empty 
    expect(JSON.parse(response.body)['tickets'].first['created_at']).to eq(nil)
  end
end
