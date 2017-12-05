require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { annual_fund: @payment.annual_fund, date: @payment.date, fine: @payment.fine, month: @payment.month, payment_mode: @payment.payment_mode, previous_books: @payment.previous_books, section_id: @payment.section_id, student_id: @payment.student_id, total: @payment.total, tuition_fee: @payment.tuition_fee, year: @payment.year }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { annual_fund: @payment.annual_fund, date: @payment.date, fine: @payment.fine, month: @payment.month, payment_mode: @payment.payment_mode, previous_books: @payment.previous_books, section_id: @payment.section_id, student_id: @payment.student_id, total: @payment.total, tuition_fee: @payment.tuition_fee, year: @payment.year }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
