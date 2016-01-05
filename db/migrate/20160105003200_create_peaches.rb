class CreatePeaches < ActiveRecord::Migration
  def change
    create_table :peaches do |t|
      t.string :name
      t.integer :deadline

      t.timestamps null: false
    end
  end
end
