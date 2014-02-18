class CreateMMaterials < ActiveRecord::Migration
  def change
    create_table :m_materials do |t|
			t.string :name

      t.timestamps
    end
  end
end
