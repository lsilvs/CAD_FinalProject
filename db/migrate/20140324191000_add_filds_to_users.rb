class AddFildsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :credit, :float, default: 0.0
  end
end
