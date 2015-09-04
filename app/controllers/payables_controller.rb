class PayablesController < ApplicationController
  def index
    @payables = Payable.all
  end

  def show
    @property = Property.find(params[:property_id])
    @payable = Payable.find(params[:id])
    @payables = Payable.where(vendor: @payable.vendor)
  end

  def new
    @property = Property.find(params[:id])
    @payable = Payable.new(payable_params)
  end

  def create
    @property = Property.find(params[:property_id])
    @payable = Payable.new(payable_params)
    @payable.property = @property
    @new_payable = Payable.new
    @payables = Payable.all

    if @payable.save
      flash[:notice] = "Made New Payable"
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
    @payable = Payable.find(params[:id])

    if @payable.destroy
      flash[:notice] = "Payable Deleted"
      redirect_to @property
    else
      flash[:error] = "Something went wrong"
      render :show
    end
  end
  private

  def payable_params
    params.require(:payable).permit(:vendor, :amount, :date, :duedate)
  end
end
