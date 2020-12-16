class RemoveRatingFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :rating
  end
end
