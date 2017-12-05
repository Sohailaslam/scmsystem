class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.belongs_to :section, index: true, foreign_key: true #section means Class
      t.string :admission_number, null: false
      t.integer :tuition_fee
      t.timestamps null: false
    end
    add_index :students, :admission_number,unique: true
  end
end
