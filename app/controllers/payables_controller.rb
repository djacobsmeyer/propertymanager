class PayablesController < ApplicationController
  def index
    @payables = Payable.all
  end

  def new
    @property = Property.find[params(:id)]
    @payable = Payable.new[payable_params]
  end

  def create
    @property = Property.find[params(:id)]
    @payable = Payable.new[payable_params]
    @payable.property = @property

    if @payable.save
      flash[:notice] = "Made New Payable"
    else
      flash[:error] = "Something went wrong"
    end
  end

  private

  def payable_params
    params.require(:payable).permit(:vendor, :amount, :date, :duedate)
  end
end
