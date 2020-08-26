class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.date   :birthday, null: false
      t.references :user
      t.timestamps
    end
  end
end
