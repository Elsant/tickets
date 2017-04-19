class Api::V1::TicketsController < ApplicationController
  before_action :get_tickets, only: [:index, :close]

  def index
    render json: { user_role: current_user.role, token: form_authenticity_token, tickets: serialized_tickets}
  end

  def create
    @ticket = Ticket.new(ticket_params.merge!(user: current_user))

    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def close
    @ticket = Ticket.find params[:id]
    @ticket.update(closed: Time.zone.now)
    render json: { user_role: current_user.role, token: form_authenticity_token, tickets: serialized_tickets}, status: :ok
  end

  def serialized_tickets
     ActiveModelSerializers::SerializableResource.new(@tickets, {}).as_json
  end

  private
    def get_tickets
      @tickets =
        case current_user.role
          when 'agent', 'admin'
            Ticket.all
          else
            current_user.tickets
          end  
    end

    def ticket_params
      params.require(:ticket).permit(:title, :body)
    end
end
