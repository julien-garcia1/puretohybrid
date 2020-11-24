class TicketsController < ApplicationController
  def index
    @tickets = Ticket.where({status: ['en cours', 'en attente']})
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket = Ticket.new(user_id: 'toto', status: 'En attente')
    if @ticket.save
      redirect_to root_path, notice: 'Votre ticket a bien été créé, un vendeur est en chemin'
    else
      render new
    end
  end

  def accept
  end

  def close
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_firstname, :status, :user_id, :product_id)
  end
end
