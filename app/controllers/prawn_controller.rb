class PrawnController < ApplicationController
  require 'prawn'

  def new

  end

  def create
    Prawn::Document.generate("invoice#{DateTime.now}.pdf") do |pdf|
      render  layout: "/layouts/prawn/receivable" # text/formating to be made into pdf
      if pdf.save
        # do something
        redirect_to :receivable
      else
        [flash] :error("PDF could not be created")
        render :receivable
    end

  end

end
