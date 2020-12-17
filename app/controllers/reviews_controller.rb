class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_ticket, only: [:new, :create]
  def show
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.ticket = @ticket
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def review_params
    params.require(:review).permit(:rating)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
