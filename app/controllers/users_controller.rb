class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @receivable = Receivable.find(params[:id])
    @receivables = Receivable.where(payer: @receivable.payer)
    @tenant = @user.tenant
    @requests = @tenant.requests
  end
end
