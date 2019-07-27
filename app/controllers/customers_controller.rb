class CustomersController < ApplicationController
  def index
    @customers = Customer.where(user_id: current_user.id).where('tel LIKE(?) or day LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%")
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path, notice: "予約を登録しました"
    else
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :people, :tel, :day, :time, :text).merge(user_id: current_user.id)
  end
end
