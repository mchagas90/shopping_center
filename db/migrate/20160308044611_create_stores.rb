class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :registration_code

      t.timestamps null: false
    end
  end
end
