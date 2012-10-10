class Price < ActiveRecord::Base
  belongs_to :product
  attr_accessible :amount, :quantity
end
