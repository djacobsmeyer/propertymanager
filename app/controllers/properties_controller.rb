class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @properties = Property.all
    @property = Property.new
  end

  def show
    @user = current_user
    @property = Property.find(params[:id])
    @tenant = Tenant.new
    @payables = @property.payables
    @payable = Payable.new
    @receivables = @property.receivables
    @receivable = Receivable.new

  end

  def new
    @user = current_user
    @property = Propety.new
  end

  def create
    @user = current_user
    @property = Property.new(property_params)
    @property.user = @user
    @new_property = Property.new
    @properties = Property.all

    if @property.save
      flash[:notice] = "Made New Property"
    else
      flash[:error] = "Something went wrong"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :city, :state, :zipcode)
  end
end
