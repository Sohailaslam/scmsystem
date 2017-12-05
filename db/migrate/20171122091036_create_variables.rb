class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.integer :year,null: false
      t.string :month,null: false
      t.integer :date,null: false
      t.string :payment_mode,null: false

      t.timestamps null: false
    end
  end
end
