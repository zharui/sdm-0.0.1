class CreateMTypes < ActiveRecord::Migration
  def change
    create_table :m_types do |t|
			t.string :name

      t.timestamps
    end
		add_index :m_types, :name, unique: true
  end
end
