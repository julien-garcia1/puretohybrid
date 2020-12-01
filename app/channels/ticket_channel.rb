class TicketChannel < ApplicationCable::Channel
  def subscribed
    ticket = Ticket.find(params[:id])
    ap "je suis dans #{__method__}"
    ap ticket
    stream_for ticket
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
