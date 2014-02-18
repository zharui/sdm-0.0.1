class CreateMOrdinaryPositions < ActiveRecord::Migration
  def change
    create_table :m_ordinary_positions do |t|

      t.timestamps
    end
  end
end
