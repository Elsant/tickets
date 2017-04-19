require 'rails_helper'

RSpec.describe TicketSerializer, type: :serializer do

  before(:each) do
    @user = create(:user)
    @ticket = create(:ticket, user: @user)
    @serializer = TicketSerializer.new(@ticket)
    @serialization = ActiveModelSerializers::Adapter.create(@serializer)
  end

  it 'should have an id that matches' do
    subject = JSON.parse(@serialization.to_json) 
    expect(subject['id']).to eql(@ticket.id)
  end

  it 'should have a title that matches' do
    subject = JSON.parse(@serialization.to_json)
    expect(subject['title']).to eql(@ticket.title)
  end

  it 'should have a body that matches' do
    subject = JSON.parse(@serialization.to_json) 
    expect(subject['body']).to eql(@ticket.body)
  end

  it 'should have a closed_status that matches' do
    subject = JSON.parse(@serialization.to_json)
    expect(subject['closed_status']).to eql(@ticket.closed_status)
  end

  it 'should have a closed_day that matches' do
    subject = JSON.parse(@serialization.to_json) 
    expect(subject['closed_day']).to eql(@ticket.closed_day)
  end
end