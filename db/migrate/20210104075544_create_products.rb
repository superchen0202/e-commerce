class CreateProducts < ActiveRecord::Migration[6.1]
 
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :list_price
      t.decimal :sell_price
      t.belongs_to :vendor, null: false, foreign_key: true
      t.boolean :on_sell, default: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :products, :deleted_at
    add_index :products, :code, unique: true
    

  end
end