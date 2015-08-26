class PropertiesController < ApplicationController
  def index
    @user = current_user
    @properties = Property.all
    @property = Property.new
  end

  def new
    @user = current_user
    @property = Propety.new
  end

  def create
    @user = current_user
    @property = Property.new(propertyparams)

    if @property.save
      flash[:notice] = "Made New Property"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end

  def propertyparams
    params.require(@property).permit(:address, :city, :state, :zipcode)
  end
end
