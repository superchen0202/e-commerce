class AddShipmentStatusToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipment_status, :string, default: "pending"
  end
end
