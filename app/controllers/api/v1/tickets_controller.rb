class Api::V1::TicketsController < ApplicationController

  def index
    @tickets =
      case current_user.role
        when 'agent', 'admin'
          Ticket.all
        else
          current_user.tickets
        end

    render json: @tickets
  end
end
