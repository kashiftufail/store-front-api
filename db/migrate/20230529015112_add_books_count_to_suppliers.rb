class AddBooksCountToSuppliers < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :books_count, :integer
  end
end
