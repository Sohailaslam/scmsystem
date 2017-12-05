class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def defaulters
    if params[:month].present?
      @params = params[:month]
      # @search = Payment.search(params[:q])
      @param_def = Student.where.not(id: Payment.where(month: @params).map(&:student_id))
    else
      @jan_def = Student.where.not(id: Payment.where(month: "January").map(&:student_id))
      @feb_def = Student.where.not(id: Payment.where(month: "February").map(&:student_id))
      @mar_def = Student.where.not(id: Payment.where(month: "March").map(&:student_id))
      @apr_def = Student.where.not(id: Payment.where(month: "April").map(&:student_id))
      @may_def = Student.where.not(id: Payment.where(month: "May").map(&:student_id))
      @jun_def = Student.where.not(id: Payment.where(month: "June").map(&:student_id))
      @jul_def = Student.where.not(id: Payment.where(month: "July").map(&:student_id))
      @aug_def = Student.where.not(id: Payment.where(month: "August").map(&:student_id))
      @sept_def = Student.where.not(id: Payment.where(month: "September").map(&:student_id))
      @oct_def = Student.where.not(id: Payment.where(month: "October").map(&:student_id))
      @nov_def = Student.where.not(id: Payment.where(month: "November").map(&:student_id))
      @dec_def = Student.where.not(id: Payment.where(month: "December").map(&:student_id))
    end
  end
end
