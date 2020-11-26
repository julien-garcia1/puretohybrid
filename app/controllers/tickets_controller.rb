class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :ticket_response]

  def index
    @tickets_to_be_assign = Ticket.where(status: 'En attente')
    @tickets_assigned = Ticket.where(status: 'En cours')
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.status = 'En attente'
    if @ticket.save
      StoreChannel.broadcast_to(
        Store.first.id,
        render_to_string(partial: "ticket", locals: { ticket: @ticket })
      )
        redirect_to ticket_path(@ticket), notice: 'Votre ticket a bien été créé, un vendeur est en chemin'
    else
      render :new
    end
  end

  def assign
    @ticket = Ticket.find(params[:id])
    @ticket.user = current_user
    @ticket.status = 'En cours'
    @ticket.save
    redirect_to tickets_path
  end

  def closed
    @ticket = Ticket.find(params[:id])
    @ticket.status = 'Terminé'
    @ticket.save
    redirect_to tickets_path
  end

  def ticket_response
    @ticket = Ticket.last
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_firstname, :status, :user_id, :product_id)
  end

end
