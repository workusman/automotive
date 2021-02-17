class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false, default: ''
      t.string :phone_number
      t.timestamps
    end
  end
end
