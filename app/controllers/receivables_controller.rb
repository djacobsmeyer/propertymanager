class ReceivablesController < ApplicationController
  def index
    @receivables = Receivable.all
  end

  def new
    @property = Property.find[params(:id)]
    @receivable = Receivable.new
  end

  def show
    @property = Property.find(params[:property_id])
    @receivable = Receivable.find(params[:id])
    @receivables = Receivable.where(payer: @receivable.payer)
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

  def destroy
    @property = Property.find(params[:property_id])
    @receivable = Receivable.find(params[:id])

    if @receivable.destroy
      flash[:notice] = "Receivable Deleted"
      redirect_to @property
    else
      flash[:error] = "Something went wrong"
      render :show
    end
  end
  
  private

  def receivable_params
    params.require(@receivable).permit(:payer, :amount, :date, :duedate)
  end
end
