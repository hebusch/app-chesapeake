class ReceptionsController < ApplicationController

  def index
    @receptions = Reception.all
  end

  def show
    @reception = set_reception
    @cajasOk = Caja.where(
      :lote_id => @reception.lote.id,
      :received => true
    )
  end

  def search
    @do = false
    code = params[:code_id]
    if code.present?
      @do = true
      @reception = Reception.find(session[:reception_id])
      @caja_code = Caja.find_by(code: params[:code_id])
      if @caja_code.present?
        if @reception.lote.cajas.exists?(@caja_code.id)
          @box_in = true
          if @caja_code.received
            @passed = true
          else
            @passed = false
            @caja_code.update_attribute(:received, true)
          end
        else
          @box_in = false
        end
      end
    end
    respond_to do |format|
      format.js {}
    end
  end

  private

  def set_reception
    session[:reception_id] = params[:id]
    return Reception.find(params[:id])
  end

end
