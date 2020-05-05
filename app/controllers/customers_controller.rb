class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update]


  def index
    @customers = Customer.where(user_id: current_user.id).where('tel LIKE(?) or day LIKE(?) or name LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path, notice: "予約を登録しました"
    else
      redirect_to new_customer_path, alert: "名前、もしくは電話番号が未入力です"
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to root_path, notice: "顧客情報を編集しました"
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :people, :tel, :day, :time, :text, { :table_ids => [] }).merge(user_id: current_user.id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
