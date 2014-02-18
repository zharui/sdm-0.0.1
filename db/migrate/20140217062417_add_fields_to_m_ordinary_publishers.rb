class AddFieldsToMOrdinaryPublishers < ActiveRecord::Migration
  def change
		add_column :m_ordinary_publishers, :name, 						:string
		add_column :m_ordinary_publishers, :url,							:string
		add_column :m_ordinary_publishers, :state_id,					:integer
		add_column :m_ordinary_publishers, :tag_ids,					:integer, array: true, default: []
		add_column :m_ordinary_publishers, :created_user_id,	:integer
		add_column :m_ordinary_publishers, :modified_user_id,	:integer

		add_index :m_ordinary_publishers,	:name, unique: true
  end
end
