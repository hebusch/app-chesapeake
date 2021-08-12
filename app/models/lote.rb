class Lote < ApplicationRecord
    has_many: :cajas, dependent: :destroy,
end
