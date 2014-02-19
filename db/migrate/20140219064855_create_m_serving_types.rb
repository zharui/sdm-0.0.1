class CreateMServingTypes < ActiveRecord::Migration
  def change
    create_table :m_serving_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
