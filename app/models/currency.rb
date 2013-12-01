class Currency < ActiveRecord::Base
  has_many :conversion_rates

  validates :code, length: { is: 3 }
end
