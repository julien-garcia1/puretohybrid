class AddTicketIdtoReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :ticket, index: true, foreign_key: true
  end
end
