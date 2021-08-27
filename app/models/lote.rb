class Lote < ApplicationRecord
    has_many :cajas, dependent: :destroy
    has_one :reception
end
