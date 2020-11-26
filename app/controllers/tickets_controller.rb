class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

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
    # @store = Store.find(params[:store_id])
    @ticket.status = 'En attente'
    # @ticket.user_id = User.nickname
    if @ticket.save
      redirect_to ticket_response_path, notice: 'Votre ticket a bien été créé, un vendeur est en chemin'
      # StoreChannel.broadcast_to(
      #   @store,
      #   render_to_string(partial: "ticket", locals: { ticket: @ticket })
      # )
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
