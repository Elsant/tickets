class TicketsController < ApplicationController

  def index
    @tickets =
      case current_user.role
        when 'agent', 'admin'
          Ticket.all
        else
          current_user.tickets
        end
  end

  def export
    if current_user.agent? || current_user.admin?
      @tickets_closed = Ticket.closed_last_month.includes(:user)

      respond_to do |format|
        format.pdf do
          # must be new Class
          pdf = Prawn::Document.new
          pdf.font_size(25)
          pdf.text 'Closed Tickets (last month)'
          pdf.move_down 10
          pdf.font("Helvetica", :size => 12)

          table_arrray = @tickets_closed.map { |ticket| [ticket.user_email, ticket.title, ticket.closed_day] }
          table_arrray.unshift ['User', 'Title', 'Closed']

          pdf.table(table_arrray, header: true, width: 500, row_colors: [ "FFFFFF", "ECF0F1"])

          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    else
       redirect_to root_path
    end
  end
end
