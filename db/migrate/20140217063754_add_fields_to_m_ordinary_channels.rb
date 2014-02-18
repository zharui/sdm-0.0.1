class AddFieldsToMOrdinaryChannels < ActiveRecord::Migration
  def change
		add_column :m_ordinary_channels, :name, 						:string
		add_column :m_ordinary_channels, :url,							:string
		add_column :m_ordinary_channels, :state_id,					:integer
		add_column :m_ordinary_channels, :publisher_id,					:integer
		add_column :m_ordinary_channels, :tag_ids,					:integer, array: true, default: []
		add_column :m_ordinary_channels, :created_user_id,	:integer
		add_column :m_ordinary_channels, :modified_user_id,	:integer

		add_index :m_ordinary_channels,	:name, unique: true
		add_index :m_ordinary_channels, :publisher_id
  end
end
