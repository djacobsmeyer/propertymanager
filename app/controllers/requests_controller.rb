class RequestsController < ApplicationController
  def show

  end

  def create
    @tenant = current_tenant #Tenant.find(params[:tenant_id])
    @request = Request.new(request_params)
    @new_request = Request.new

    if @request.save
      flash[:notice] = "Made New Request"
    else
      flash[:error] = "Something went wrong"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @request = Request.find(params[:id])

    if @request.completed
      @request.update_attribute(:completed, "false")
    else
      @request.update_attribute(:completed, "true")
    end

    render js: ""
  end

  def destroy

  end

  private

  def request_params
    params.require(@request).permit(:title, :description)
  end
end
