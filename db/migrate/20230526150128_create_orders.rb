class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date_submited
      t.float :subtotal
      t.float :shipping
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
