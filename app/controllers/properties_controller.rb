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
  end

  def new
    @user = current_user
    @property = Propety.new
  end

  def create
    @user = current_user
    @property = Property.new(propertyparams)
    @property.user = @user
    @new_property = Property.new
    
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

  def propertyparams
    params.require(:property).permit(:address, :city, :state, :zipcode)
  end
end
