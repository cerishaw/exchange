class Currency < ActiveRecord::Base
  validates :code, length: { is: 3 }
end