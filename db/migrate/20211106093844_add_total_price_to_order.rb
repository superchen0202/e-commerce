class AddTotalPriceToOrder < ActiveRecord::Migration[6.1]
  def change
    
    add_column :orders, :total_price, :decimal, default: 0



  end
end
