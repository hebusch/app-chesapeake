class CreateCortes < ActiveRecord::Migration[5.2]
  def change
    create_table :cortes do |t|

      t.integer :code, null: false
      t.string :description, null: false

    end

    add_index :cortes, :code, unique: true 
  end
end
