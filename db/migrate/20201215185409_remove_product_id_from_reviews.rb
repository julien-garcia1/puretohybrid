class RemoveProductIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :product, index: true, foreign_key: true
  end
end
