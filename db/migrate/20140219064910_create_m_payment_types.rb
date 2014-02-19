class CreateMPaymentTypes < ActiveRecord::Migration
  def change
    create_table :m_payment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
