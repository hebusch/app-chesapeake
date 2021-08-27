class CreateReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :receptions do |t|
      t.references :lote, null: false, foreign_key: true
      t.boolean :finished, default: false
      t.string :file
      
      t.timestamps
    end
  end
end
