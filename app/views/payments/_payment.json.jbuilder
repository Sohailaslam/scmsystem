json.extract! payment, :id, :student_id, :section_id, :year, :month, :date, :payment_mode, :tuition_fee, :fine, :previous_books, :annual_fund, :total, :created_at, :updated_at
json.url payment_url(payment, format: :json)
