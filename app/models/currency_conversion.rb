class CurrencyValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    valid_codes = Currency.all.map {|currency| currency.code}
    unless valid_codes.include? value
      record.errors[attribute] <<(options[:message] || "is not a valid currency")
    end

  end
end

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
  validates :from_code, presence:true, currency: true
  validates :to_code, presence:true, currency: true
end

