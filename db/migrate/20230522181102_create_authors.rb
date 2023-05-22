class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :title
      t.string :full_name

      t.timestamps
    end
  end
end
