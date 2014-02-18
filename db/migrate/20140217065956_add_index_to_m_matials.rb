class AddIndexToMMatials < ActiveRecord::Migration
  def change
		add_index :m_materials, :name, unique: true
  end
end
