class TenantsController < ApplicationController

  def show
    @tenant = Tenant.find(params[:id])
    @tenant.property = @property
    @property = Property.find(params[:property_id])
    @request = @tenant.request
    @requests = Request.where(tenant: @request.tenant)
  end

  def new
    @property = Property.find(params[:id])
    @tenant = Tenant.new
  end

  def create
    @property = Property.find(params[:property_id])
    @tenant = Tenant.new(tenant_params)
    @tenant.property = @property
    @new_tenant = Tenant.new

    if @tenant.save
      flash[:notice] = "Made New Tenant"
    else
      flash[:error] = "Something went wrong"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :address, :city, :state, :zipcode, :leasestart, :leaseend)
  end
end
