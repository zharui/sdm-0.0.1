class CreateMDimensions < ActiveRecord::Migration
  def change
    create_table :m_dimensions do |t|
			t.string :name		

      t.timestamps
    end
		add_index :m_dimensions, :name, unique: true
  end
end
