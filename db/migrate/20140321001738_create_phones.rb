class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.float :credit
      t.integer :data

      t.timestamps
    end
  end
end
