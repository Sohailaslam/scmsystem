class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :section, index: true, foreign_key: true
      t.integer :year
      t.string :month
      t.integer :date
      t.string :payment_mode
      t.integer :tuition_fee
      t.integer :library_fund
      t.integer :computer_fee
      t.integer :science_lab_fee
      t.integer :video_music_fee
      t.integer :sports_fund
      t.integer :workbook_charges
      t.integer :AC_charges
      t.integer :generator_charges
      
      t.integer :fine
      t.integer :previous_books
      t.integer :annual_fund
      t.integer :total

      t.timestamps null: false
    end
  end
end
