class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /payments
  # GET /payments.json
  def index
    if current_user.has_role? :manager
      @payments = Payment.all
    else
      @payments = current_user.lease.payments
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @user = current_user
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])
    @payment.ip_address = request.remote_ip
    @payment.user = current_user
    @payment.lease = current_user.lease
    @user = current_user

    respond_to do |format|
      if @payment.save
        if @payment.make_transaction
          format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @payment }
        else
          @payment.destroy
          format.html { render action: 'failed'}
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :ip_address, :first_name, :last_name, :card_expires_on, :card_number)
    end
end
