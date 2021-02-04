class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :skus, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
