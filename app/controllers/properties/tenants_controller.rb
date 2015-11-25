class Properties::TenantsController < ApplicationController
  # MANAGER TENANTSCONTROLLER
  layout "manager"

  def show
    @tenant = Tenant.find(params[:id])
    @property = Property.find(params[:property_id])
    @requests = @tenant.requests
  end

  def edit

  end

  def update

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

    # upon creation of a new tenant, an invitation will be emailed to them to sign up for a tenant account to login to the tenant portal
    if @tenant.save
      TenantMailer.invite_mailer(@tenant).deliver_now
      flash[:notice] = "Made New Tenant"
      redirect_to @property
    else
      flash[:error] = "Something went wrong"
      render @property
    end

  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :email, :password, :address, :city, :state, :zipcode, :leasestart, :leaseend)
  end
end
