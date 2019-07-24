class TablesController < ApplicationController

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

end
