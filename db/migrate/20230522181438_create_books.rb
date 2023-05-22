class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.datetime :year_published
      t.integer :reviews
      t.float :price
      t.boolean :out_of_print, null: false, default: false
      t.references :supplier, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
