class AddAadharNumberToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :aadhar_number, :bigint
  end
end
