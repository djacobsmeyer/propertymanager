class PrawnController < ApplicationController
  require 'prawn'

  def create
    # new_pdf = Prawn::Document.generate("invoice#{DateTime.now}.pdf") do |pdf|
    #   # render layout: "/layouts/prawn/receivable" # text/formating to be made into pdf
    #   pdf.text "test"
    #   # if pdf.save
    #     # do something
    #     # render html: "ohhhh"
    #     # redirect_to :receivable
    #   # else
    #     flash[:error] = "PDF could not be created"
    #     # render :receivable
    #   # end
    # end
    #
    #
    # binding.pry
    #
    # render html: "ohhhh"

    pdf = Prawn::Document.new
    pdf.text = render layout: "/layouts/prawn/receivable"
    send_data pdf.render, :filename => "Invoice#{DateTime.now}.pdf", :type => "application/pdf", disposition: 'inline'


  end

end
