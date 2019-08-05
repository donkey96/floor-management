class CustomersTablesController < ApplicationController

  def destroy
    @customer = CustomersTable.find_by(params[:id])
    if @customer.destroy
      redirect_to root_path, notice: "予約を削除しました"
    else
      render :root
    end
  end

end
