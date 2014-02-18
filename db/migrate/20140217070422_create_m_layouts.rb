class CreateMLayouts < ActiveRecord::Migration
  def change
    create_table :m_layouts do |t|
			t.string :name

      t.timestamps
    end
		add_index :m_layouts, :name, unique: true
  end
end
