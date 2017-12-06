class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /payments
  # GET /payments.json
  def index
    @search = Payment.search(params[:q])
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @variable = Variable.last
    if !@variable.present?
      redirect_to students_path, notice: "Set These valuese first. Then You'll be able to add Payments."
    end
    if params[:for].present?
      @student = Student.find(params[:for])
    end
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.student_id = Student.find_by_admission_number(@payment.student_id).id
    @payment.section_id = Student.find(@payment.student_id).section_id

    respond_to do |format|
      if @payment.save
        format.html { redirect_to new_payment_path, notice: 'Payment Record was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "January") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "January").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "February") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "February").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "March") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "March").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "April") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "April").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "May") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "May").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "June") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "June").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "July") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "July").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "August") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "August").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "September") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "September").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "October") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "October").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "November") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "November").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    # 
    workbook.add_worksheet(name: "December") do |sheet|
      sheet.add_row ["Admission Number", "Name","Class"]
      students = Student.where.not(id: Payment.where(month: "December").map(&:student_id))
      students.each do |st|
        sheet.add_row [st.admission_number, st.name,st.section.name]
      end
    end
    
    send_data package.to_stream.read, :filename => "defaulters.xlsx"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:student_id, :section_id, :year, :month, :date, :payment_mode, :tuition_fee,:library_fund,:computer_fee,:science_lab_fee,:video_music_fee,:sports_fund,:workbook_charges,:AC_charges,:generator_charges, :fine, :previous_books, :annual_fund, :total)
    end
end
