class CreateSkus < ActiveRecord::Migration[6.1]
  def change
    create_table :skus do |t|
      t.belongs_to :products, null: false, foreign_key: true
      t.string :spec
      t.integer :quantity, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :skus, :deleted_at
  end
end
