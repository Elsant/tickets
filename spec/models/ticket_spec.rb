require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'instance methods' do
    
    it "returns user's email" do
      user = create :user
      ticket = create :ticket, user: user
      expect(ticket.user_email).to eq user.email
    end

    it 'returns status close for closed ticket' do
      user = create :user
      ticket = create :ticket, user: user, closed: Time.parse("2017-04-16 21:52:11")
      expect(ticket.closed_status).to eq 'close'
    end

    it 'returns status close for open ticket' do
      user = create :user
      ticket = create :ticket, user: user, closed: nil
      expect(ticket.closed_status).to eq 'open'
    end


    it 'returns formatted closed day data' do
      user = create :user
      ticket = create :ticket, user: user, closed: Time.parse("2017-04-16 21:52:11")
      expect(ticket.closed_day).to eq '04/16/2017'
    end
  end
end
