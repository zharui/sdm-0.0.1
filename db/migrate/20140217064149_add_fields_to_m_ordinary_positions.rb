class AddFieldsToMOrdinaryPositions < ActiveRecord::Migration
  def change
		add_column :m_ordinary_positions, :name,							:string
		add_column :m_ordinary_positions, :state_id,					:integer
		add_column :m_ordinary_positions, :tag_ids,						:integer, array: true, default: []
		add_column :m_ordinary_positions, :publisher_id,			:integer
		add_column :m_ordinary_positions, :channel_id,				:integer
		add_column :m_ordinary_positions, :material_id,				:integer
		add_column :m_ordinary_positions, :type_id,						:integer
		add_column :m_ordinary_positions, :dimension_id,			:integer
		add_column :m_ordinary_positions, :layout_id,					:integer
		add_column :m_ordinary_positions, :format_id,					:integer
		add_column :m_ordinary_positions, :size,							:string
		add_column :m_ordinary_positions, :created_user_id,		:integer
		add_column :m_ordinary_positions, :modified_user_id,	:integer

		
		add_index :m_ordinary_positions, :name
		add_index :m_ordinary_positions, :publisher_id
		add_index :m_ordinary_positions, :channel_id	
		add_index :m_ordinary_positions, [:name, :publisher_id, :channel_id]	
  end
end
