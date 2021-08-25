class CreateLotes < ActiveRecord::Migration[5.2]
  def change
    create_table :lotes do |t|
      t.timestamps
    end
  end
end
