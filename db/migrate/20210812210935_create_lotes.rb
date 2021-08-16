class CreateLotes < ActiveRecord::Migration[5.2]
  def change
    create_table :lotes do |t|
      t.integer :lote_number, null: false
      t.string :file
      
      t.timestamps
    end
  end
end
