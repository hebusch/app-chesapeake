require 'csv'

class LotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @lotes = Lote.all
  end

  def new
    @lote = Lote.new
    lotes = Lote.all
    if lotes.length > 0
      @default = lotes.last.lote_number + 1
    else
      @default = 1
    end
  end

  def upload_form
    lotes = Lote.all
    if lotes.length > 0
      @default = lotes.last.id + 1
    else
      @default = 1
    end
  end

  def upload_process
    file = params[:lotes][:file]
    data = CSV.parse(file.to_io, headers: false, col_sep: ";")
    lote = Lote.new
    count = 1
    data.each do |row|
      corte = Corte.find_by(code: row[8].to_i)
      caja = Caja.new
      caja.private_id = count
      caja.code = row[0][0,15]
      caja.weight = row[2].to_f
      caja.lote = lote
      caja.corte = corte
      caja.save
      count += 1
    end
    lote.save
  end

  def show
    @lote = Lote.find(params[:id])
  end

  def search
    respond_to do |format|
      format.js
    end
  end
  

  private

  def lote_params
    params.require(:lote)
  end

end
