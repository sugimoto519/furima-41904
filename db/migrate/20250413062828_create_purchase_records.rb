class CreatePurchaseRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_records do |t|

      t.timestamps
    end
  end
end
