class RemoveShipmentStatusFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :shipment_status, :string
  end
end
