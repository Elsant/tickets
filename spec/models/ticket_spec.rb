require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'instance methods' do
    it 'returns formatted closed day data' do
      user = create :user
      ticket = create :ticket, user: user, closed: Time.parse("2017-04-16 21:52:11")
      expect(ticket.closed_day).to eq '04/16/2017'
    end

    it "returns user's email" do
      user = create :user
      ticket = create :ticket, user: user
      expect(ticket.user_email).to eq user.email
    end
  end
end
