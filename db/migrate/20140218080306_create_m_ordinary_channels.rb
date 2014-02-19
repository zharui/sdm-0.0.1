class CreateMOrdinaryChannels < ActiveRecord::Migration
  def change
    create_table :m_ordinary_channels do |t|

      t.timestamps
    end
  end
end
