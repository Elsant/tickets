class Ticket < ApplicationRecord
  belongs_to :user

  scope :closed_last_month, -> { where( closed: 1.month.ago.beginning_of_day .. Time.zone.now).order(closed: :desc)}

  delegate :email, to: :user, prefix: true

  def closed_status 
    closed ? 'open' : 'close'
  end

  def closed_day 
    closed.strftime("%m/%d/%Y") if closed
  end
end
