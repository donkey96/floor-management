class TablesController < ApplicationController

  def index
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to root_path, notice: "テーブルを登録しました"
    else
      render :new
    end
  end

  private
  def table_params
    params.require(:table).permit(:name).merge(user_id: current_user.id)
  end

end