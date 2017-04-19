class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :closed_status, :closed_day
end
