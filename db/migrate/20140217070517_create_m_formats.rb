class CreateMFormats < ActiveRecord::Migration
  def change
    create_table :m_formats do |t|
			t.string :name

      t.timestamps
    end
		add_index :m_formats, :name, unique: true
  end
end
