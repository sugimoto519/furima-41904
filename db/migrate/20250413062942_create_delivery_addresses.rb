class CreateDeliveryAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_addresses do |t|

      t.timestamps
    end
  end
end
