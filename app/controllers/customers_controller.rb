class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy blacklist]

  def index
    @customers = Customer.where(blacklist: false)
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: "Customer created"
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer updated"
    else
      render :edit
    end
  end

  def blacklist
    if @customer.blacklisted?
      @customer.update(blacklist: false)
      redirect_to customers_path, notice: "Customer blacklisted"
    else
      @customer.update(blacklist: true)
      redirect_to customers_blacklisted_path, notice: "Customer blacklisted"
    end
  end

  def blacklisted
    @customers = Customer.where(blacklist: true)
  end

  def destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :description, :blacklist)
  end
end
