class AddNameAndRoleTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role_type, :integer, default: 0
    add_column :users, :name, :string
  end
end
