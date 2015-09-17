class TenantsController < ApplicationController
  # TENANT TENANTSCONTROLLER

  def show
    #Purpose: show one given tenant's lease details and payment history and request
    @tenant = current_tenant #Tenant.find(params[:id])
    @receivables = @tenant.receivables
    @requests = @tenant.requests
    @request = Request.new
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

  def edit
    @tenant = Tenant.find(params[:id])

  end

  def update
    @tenant = Tenant.find(params[:id])

    if @tenant.update_attributes(tenant_params)
      flash[:notice] = "Saved Tenant Info"
      redirect_to :tenant
    else
      flash[:error] = "Something went wrong"
      render :tenant
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :address, :city, :state, :zipcode, :leasestart, :leaseend)
  end
end
