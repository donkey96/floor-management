class TablesController < ApplicationController

  def index
    @table = Table.where(params[:customer_id])
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to root_path, notice: "テーブルを登録しました"
    else
      redirect_to new_table_path, alert: "テーブル名を入力してください"
    end
  end

  def destroy
    Table.find(params[:id]).destroy
    redirect_to root_path, notice: "予約を削除しました"
  end

  private
  def table_params
    params.require(:table).permit(:name).merge(user_id: current_user.id)
  end

end
