class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @tickets_to_be_assign = Ticket.where(status: 'En attente')
    @tickets_assigned = Ticket.where(status: 'En cours')
    @reviews = Review.all
    @average_rating = @reviews.average(:rating)
    no_footer
  end

  def show
    @ticket = Ticket.find(params[:id])
    @review = Review.new
    no_footer
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.status = 'En attente'
    @ticket.section = params[:commit]
    if @ticket.save
      StoreChannel.broadcast_to(
        Store.first,
        body: render_to_string(partial: "tickets/ticket", locals: { ticket: @ticket, new: true })
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
    TicketChannel.broadcast_to(@ticket, action: 'refresh')
    StoreChannel.broadcast_to(@store, action: 'refresh')
    redirect_to tickets_path
  end

  def closed
    @ticket = Ticket.find(params[:id])
    @ticket.status = 'Terminé'
    @ticket.save
    TicketChannel.broadcast_to(@ticket, action: 'refresh')
    redirect_to tickets_path
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to new_ticket_path, notice: "Votre demande d'aide à un vendeur à bien été annulée"
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client_firstname, :status, :user_id, :product_id, :section)
  end

end
