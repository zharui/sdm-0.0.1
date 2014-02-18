class CreateMStates < ActiveRecord::Migration
  def change
    create_table :m_states do |t|
			t.string :name

      t.timestamps
    end
  end
end
