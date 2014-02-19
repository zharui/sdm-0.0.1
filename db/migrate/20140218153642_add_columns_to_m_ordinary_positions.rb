class AddColumnsToMOrdinaryPositions < ActiveRecord::Migration
  def change
		add_column :m_ordinary_positions, :name, :string
		add_column :m_ordinary_positions,	:url, :string
		add_column :m_ordinary_positions,	:state_id, :string
		add_column :m_ordinary_positions,	:tag_ids, :integer, array: true, default: []	
		add_column :m_ordinary_positions,	:m_ordinary_publisher_id, :integer
		add_column :m_ordinary_positions, :m_ordinary_channel_id, :integer
		add_column :m_ordinary_positions,	:material_id, :integer
		add_column :m_ordinary_positions,	:dimension_id, :integer
		add_column :m_ordinary_positions, :layout_id, :integer
		add_column :m_ordinary_positions, :format_id, :integer
		add_column :m_ordinary_positions, :size, :string
		add_column :m_ordinary_positions, :created_user_id, :integer
		add_column :m_ordinary_positions, :modified_user_id, :integer
		add_column :m_ordinary_positions, :serving_id, :integer
    add_column :m_ordinary_positions, :payment_id, :integer

		add_index :m_ordinary_positions, :name, unique: true
 		add_index :m_ordinary_positions, :m_ordinary_publisher_id
		add_index :m_ordinary_positions, :m_ordinary_channel_id

  end
end
