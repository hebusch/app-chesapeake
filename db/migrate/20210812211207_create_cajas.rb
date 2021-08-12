class CreateCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :cajas do |t|

      t.string :code, null: false
      t.float :weight, null: false
      t.references :corte, null: false, foreign_key: true
      t.references :lote, null: false, foreign_key: true

    end

    add_index :cajas, :code, unique: true
  end
end