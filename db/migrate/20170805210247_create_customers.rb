class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.integer :order_id
      t.timestamps
    end
  end
end
