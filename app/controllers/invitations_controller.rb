class InvitationsController < ApplicationController
  def create
    @tenant = Tenant.find(params[:tenant_id])
    TenantMailer.invite_mailer(@tenant).deliver

    redirect_to :back, notice: "Email Invitation Sent!"
  end
end
