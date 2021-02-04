class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :number
      t.belongs_to :user, null: false, foreign_key: true
      t.string :reciever
      t.string :phone
      t.string :address
      t.text :note
      t.string :state, default: "pending"
      t.string :transcation_id
      t.datetime :paid_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
