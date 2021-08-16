require 'csv'

class LotesController < ApplicationController
  before_action :authenticate_user!

  def index
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

  def create
    @lote = Lote.new(lote_params)
    @lote.save
    csv_file = File.read(params[:file])
    csv = CSV.parse(csv_text, :headers => false)
    csv.each do |cj|
      caja = Caja.new
    end
  end

  private

  def lote_params
    params.require(:lote).permit(:lote_number, :file)
  end

end
