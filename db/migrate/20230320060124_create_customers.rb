class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.belongs_to :user
      t.belongs_to :service_provider

      t.timestamps
    end
  end
end
