class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.float :credit
      t.belongs_to :user

      t.timestamps
    end
    add_index :phones, :user_id
  end
end
