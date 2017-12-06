class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :section, index: true, foreign_key: true
      t.integer :year
      t.string :month
      t.integer :date
      t.string :payment_mode
      t.integer :tuition_fee,default: 0
      t.integer :library_fund,default: 0
      t.integer :computer_fee,default: 0
      t.integer :science_lab_fee,default: 0
      t.integer :video_music_fee,default: 0
      t.integer :sports_fund,default: 0
      t.integer :workbook_charges,default: 0
      t.integer :AC_charges,default: 0
      t.integer :generator_charges,default: 0
      
      t.integer :fine,default: 0
      t.integer :previous_books,default: 0
      t.integer :annual_fund
      t.integer :total

      t.timestamps null: false
    end
  end
end
