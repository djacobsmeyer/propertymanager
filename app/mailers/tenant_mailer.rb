class TenantMailer < ApplicationMailer

  def invite_mailer(tenant)
    @tenant = tenant
    @url  = 'localhost:3000/tenant/#{@tenant_id}/edit'
    mail(to: @tenant.email, subject: 'Invitation to Property Manager')

  end
end
