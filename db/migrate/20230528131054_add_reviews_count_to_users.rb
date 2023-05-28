class AddReviewsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reviews_count, :integer
  end
end
