class ReceivablesController < ApplicationController
  def index
    @receivables = Receivable.all
  end

  def new
    @property = Property.find[params(:id)]
    @receivable = Receivable.new
  end

  def create
    @property = Property.find[params(:id)]
    @receivable = Receivable.new
    @receivable.property = @property

    if @receivable.save
      flash[:notice] = "Made New Receivable"
    else
      flash[:error] = "Something went wrong"
    end
  end

end
