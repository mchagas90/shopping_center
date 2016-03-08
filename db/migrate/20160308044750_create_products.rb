class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :store, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
