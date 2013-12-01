class CreateConversionRates < ActiveRecord::Migration
  def change
    create_table :conversion_rates do |t|
      t.date :date
      t.integer :currency_id
      t.float :rate
    end
  end
end
