class CurrencyConversion < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :date, :date
  column :amount, :integer
  column :from_code, :string
  column :to_code, :string

  validates :date, presence:true
  validates :amount, presence:true
  validates :from_code, presence:true, length: { is: 3 }
  validates :to_code, presence:true, length: { is: 3 }
end
