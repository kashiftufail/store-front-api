class AddOrdersCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :orders_count, :integer
  end
end
