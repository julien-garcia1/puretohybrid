class RemoveContentFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :content
  end
end
