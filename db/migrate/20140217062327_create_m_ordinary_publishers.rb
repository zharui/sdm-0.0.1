class CreateMOrdinaryPublishers < ActiveRecord::Migration
  def change
    create_table :m_ordinary_publishers do |t|

      t.timestamps
    end
  end
end
