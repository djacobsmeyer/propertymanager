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
    @receivable = Receivable.new(receivable_params)
    @receivable.property = @property
    @new_receivable = Receivable.new

    if @receivable.save
      flash[:notice] = "Made New Receivable"
    else
      flash[:error] = "Something went wrong"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private

  def receivable_params
    params.require(@receivable).permit(:payer, :amount, :date, :duedate)
end
