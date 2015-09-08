class Tenants::BillsController < ApplicationController
  layout "tenant"


  def show


    @bill = Receivable.find(params[:id])
    @tenant = @bill.tenant
    @property = @bill.property
    @bills = Receivable.limit(3)
  end
end
