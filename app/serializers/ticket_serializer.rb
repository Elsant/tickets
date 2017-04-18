class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :closed_status, :closed_day, :user_role

  def user_role
    current_user.role
  end
end
