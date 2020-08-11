class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :phone_number,   null: false
      t.string     :postal_code,    null: false
      t.integer    :form_id,        null: false
      t.string     :municipalities, null: false
      t.string     :street,         null: false
      t.string     :building
      t.references :item,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
