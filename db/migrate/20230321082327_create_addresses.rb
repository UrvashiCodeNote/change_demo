class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :address
      t.string  :city
      t.timestamps
    end
  end
end
