class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end
