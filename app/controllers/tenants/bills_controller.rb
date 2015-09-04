class Tenants::BillsController < ApplicationController
  layout "tenant"

  def show
    @bill = Receivable.find(params[:id])
    @tenant = @bill.property.tenant 
    @property = @bill.property
  end
end
