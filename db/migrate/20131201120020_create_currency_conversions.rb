class CreateCurrencyConversions < ActiveRecord::Migration
  def change
    create_table :currency_conversions do |t|
      t.string, :from_code
      t.string, :to_code
      t.integer :amount
      t.date :date
      t.string :new
      t.string :create

      t.timestamps
    end
  end
end
