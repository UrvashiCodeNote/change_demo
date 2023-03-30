class CreateContactBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_books do |t|
      t.references :contactable, polymorphic: true
      t.string :phone
      t.integer :status
      
      t.timestamps
    end
  end
end
