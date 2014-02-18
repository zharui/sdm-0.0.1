class CreatePerPages < ActiveRecord::Migration
  def change
    create_table :per_pages do |t|
			t.integer :per_page

      t.timestamps
    end
  end
end
